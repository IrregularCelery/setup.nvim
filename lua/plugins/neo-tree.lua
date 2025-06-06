return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "left",
				width = 100,
			},
			event_handlers = {
				{
					-- Close neotree on `file_opened`
					event = "file_opened",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})

		vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal<CR>", {})
		vim.keymap.set("n", "<leader>m", ":Neotree filesystem close<CR>", {})
	end,
}
