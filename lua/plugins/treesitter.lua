return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            ensure_installed = { "rust", "lua", "bash", "c", "cpp", "markdown", "diff", "html", "css", "javascript", "typescript" },
            auto_install = true,
            highlight = { enabled = true },
            indent = { enabled = true }
        })
    end
}
