return {
	"max397574/better-escape.nvim",
	config = function()
		require("better_escape").setup({
			timeout = 150,
			default_mappings = false,
			mappings = {
				i = {
					j = {
						k = "<Esc>",
						j = "<Esc>",
					},
					k = {
						k = "<Esc>",
						j = "<Esc>",
					},
				},
			},
		})
	end,
}
