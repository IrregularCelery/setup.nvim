return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            auto_install = true,
            highlight = { enabled = true },
            indent = { enabled = true }
        })
    end
}
