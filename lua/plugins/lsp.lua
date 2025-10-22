return {
  -- LSP handler
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "mason-org/mason.nvim",
      config = true,
    },
    {
      "mason-org/mason-lspconfig.nvim",
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    {
      "j-hui/fidget.nvim",
      opts = {
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },
    {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local builtin = require("telescope.builtin")

        -- Show documentation in hover window
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf })

        -- Jump to the definition of the word under your cursor
        vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = event.buf })

        -- Jump to the declaration of the word under your cursor
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf })

        -- Find references for the word under your cursor
        vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = event.buf })

        -- Rename the variable under your cursor
        vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { buffer = event.buf })

        -- Execute a code action for fixing an error or suggestion
        vim.keymap.set({ "n", "x" }, "<leader>a", vim.lsp.buf.code_action, { buffer = event.buf })

        -- Show function signature in a popup
        vim.keymap.set("i", "<C-j>", vim.lsp.buf.signature_help, { buffer = event.buf })

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if
          client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight)
        then
          local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

          -- Autocommand for highlighting the references of the word under the cursor
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          -- Autocommand for clearing the highlights created by the last autocomand (`CursorHold`)
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
            callback = function(event_inner)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event_inner.buf })
            end,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities =
      vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local servers = {
      -- Systems languages
      rust_analyzer = { -- Rust
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            check = {
              command = "clippy",
            },
          },
        },
      },
      clangd = {}, -- C/C++

      -- High-level languages
      gopls = {}, -- Go
      pyright = {}, -- Python

      -- Lua
      lua_ls = { -- Lua
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = {
              globals = { "vim" },
              disable = { "missing-fields" },
            },
            format = {
              enable = false,
            },
          },
        },
      },

      -- Web development
      html = {}, -- HTML
      cssls = {}, -- CSS
      ts_ls = {}, -- TypeScript/JavaScript/TSX
      svelte = {}, -- Svelte
      phpactor = {}, -- PHP

      -- Config/Data formats
      jsonls = {}, -- JSON
      yamlls = {}, -- YAML
      taplo = {}, -- TOML
      sqlls = {}, -- SQL
      graphql = {}, -- GraphQL

      -- Shell/Scripting
      bashls = {}, -- Bash

      -- Documentation
      marksman = {}, -- Markdown
    }
    local ensure_installed = vim.tbl_keys(servers or {})

    vim.list_extend(ensure_installed, { "stylua", "prettier", "shfmt" })

    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    for server, cfg in pairs(servers) do
      cfg.capabilities = vim.tbl_deep_extend("force", {}, capabilities, cfg.capabilities or {})

      vim.lsp.config(server, cfg)
      vim.lsp.enable(server)
    end
  end,
}
