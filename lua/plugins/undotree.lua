return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>")
    end
}
