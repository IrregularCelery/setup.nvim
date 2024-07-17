return { -- Autoformat
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format { async = true, lsp_fallback = true }
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
}
