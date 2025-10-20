return {
  -- LSP diagnostics and formatting injector
  "nvimtools/none-ls.nvim",
  dependencies = {
    { "nvimtools/none-ls-extras.nvim" },
    { "jayp0521/mason-null-ls.nvim" },
    { "gbprod/none-ls-shellcheck.nvim" },
  },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    local clang_format = formatting.clang_format
    local black = formatting.black
    local isort = formatting.isort
    local stylua = formatting.stylua
    local prettier = formatting.prettier
    local eslint_d = require("none-ls.diagnostics.eslint_d")
    local sqlfluff_fmt = formatting.sqlfluff
    local sqlfluff_diag = diagnostics.sqlfluff
    local shfmt = formatting.shfmt
    local shellcheck = require("none-ls-shellcheck.diagnostics")
    local checkmake = diagnostics.checkmake
    local markdownlint = diagnostics.markdownlint

    require("mason-null-ls").setup({
      ensure_installed = {
        -- Systems languages
        "clang_format", -- C/C++

        -- High-level languages
        "black", -- Python formatting
        "isort", -- Python imports

        -- Lua
        "stylua", -- Lua

        -- Web development
        "prettier", -- JS/TS/HTML/CSS/JSON/YAML/Markdown/GraphQL
        "eslint_d", -- JS/TS linting

        -- Config/Data formats
        "sqlfluff", -- SQL

        -- Shell/Scripting
        "shfmt", -- Bash formatting
        "shellcheck", -- Bash linting

        -- Build tools
        "checkmake", -- Makefile

        -- Documentation
        "markdownlint", -- Markdown
      },
      automatic_installation = true,
    })

    local sources = {
      clang_format,
      black,
      isort,
      stylua,
      prettier,
      eslint_d,
      sqlfluff_fmt,
      sqlfluff_diag,
      shfmt,
      shellcheck,
      checkmake,
      markdownlint,
    }

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = sources,
      on_attach = function(client, bufnr)
        if client:supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
