---@type LazySpec
return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon",
				on_highlights = function(highlights, colors)
					highlights["@punctuation.bracket"] = { fg = colors.blue5 }
				end,
			})
		end,
	},
}
