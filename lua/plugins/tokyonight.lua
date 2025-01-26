return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 9999,

	config = function()
		require("tokyonight").setup({
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { italic = true },
				variables = { italic = true },
			},
		})
	end,
}
