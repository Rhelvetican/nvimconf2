return {
	"nvimtools/none-ls.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local builtins = require("null-ls.builtins")

		require("null-ls").setup({
			sources = {
				builtins.diagnostics.selene,
			},
		})
	end,
}
