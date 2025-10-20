return {
  -- Dashboard view on app open
  "goolord/alpha-nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

    alpha.setup(dashboard.opts)
  end,
}
