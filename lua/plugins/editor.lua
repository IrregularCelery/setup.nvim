return {
  {
    -- Quickly escape to `Normal` mode
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        timeout = 150,
        default_mappings = false,
        mappings = {
          i = {
            j = {
              k = "<esc>",
              j = "<esc>",
            },
            k = {
              k = "<esc>",
              j = "<esc>",
            },
          },
        },
      })
    end,
  },
  {
    -- Auto-close paired characters
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
}
