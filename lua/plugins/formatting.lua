return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        -- Systems languages
        rust = { "rustfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },

        -- High-level languages
        go = { "goimports" },
        python = { "isort", "black" },

        -- Lua
        lua = { "stylua" },

        -- Web development
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },

        -- Config/Data formats
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        sql = { "sqlfluff" },
        graphql = { "prettier" },

        -- Shell/Scripting
        sh = { "shfmt" },
        bash = { "shfmt" },

        -- Documentation
        markdown = { "prettier" },

        -- Fallback
        ["_"] = { "trim_whitespace" },
      },

      -- Format on save
      format_on_save = {
        timeout_ms = 1000,
        async = false,
        lsp_fallback = true,
      },
    })
  end,
}
