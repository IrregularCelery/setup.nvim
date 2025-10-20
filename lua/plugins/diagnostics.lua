return {
  -- Diagnostic messages window
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup({ auto_close = true })

    vim.keymap.set("n", "<leader>x", "<cmd>Trouble diagnostics toggle<cr>")

    -- Show diagnostic messages as inlay hints
    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
        spacing = 2,
        severity_sort = true,
        format = function(diagnostic)
          local severity = vim.diagnostic.severity[diagnostic.severity]
          local symbols = {
            ERROR = " ",
            WARN = " ",
            INFO = " ",
            HINT = "󰌵 ",
          }
          local icon = symbols[severity] or "●"

          return string.format("%s %s", icon, diagnostic.message)
        end,
      },
      float = {
        border = "rounded",
        source = true,
      },
      underline = true,
      signs = true,
      update_in_insert = true,
    })
  end,
}
