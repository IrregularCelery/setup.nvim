return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	completion = {
		cmp = {
			enabled = true,
		},
	},
	config = function()
		require("crates").setup()
	end,
}
