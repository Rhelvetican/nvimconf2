return {
	"olimorris/onedarkpro.nvim",
	priority = 9999,
	config = function()
		require("onedarkpro").setup({
			styles = {
				types = "bold,italic",
				methods = "bold",
				keywords = "italic",
				constants = "bold",
				functions = "italic",
				variables = "italic",
				parameters = "italic",
				conditionals = "italic",
			},

			colors = {
				cursorline = "#282C34",
				bg = "#121416",
			},

			options = {
				cursorline = true,
			},
		})
	end,
}
