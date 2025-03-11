return {
	{
		"rktjmp/lush.nvim",
	},

	{
		"folke/tokyonight.nvim",

		config = function()
			require("tokyonight").setup({
				style = "night",

				styles = {
					variables = { italic = true },
					functions = { bold = true, italic = true },
					keyword = { bold = true, italic = true },
					keywords = { bold = true, italic = true },
				},

				on_highlights = function(hl, colors)
					hl.Special = { fg = colors.fg_dark }
					hl["@punctuation.special"] = { fg = colors.fg_dark }
				end,
			})
		end,
	},

	{
		"xero/miasma.nvim",
		lazy = false,
		priority = 1000,
	},
}
