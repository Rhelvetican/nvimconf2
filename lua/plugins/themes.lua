return {
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
					hl.Substitute = {}
					hl.Special = { fg = colors.fg_dark }
					hl.Operator = { fg = colors.fg_dark }
					hl["@punctuation.delimiter"] = { fg = colors.fg_dark }
					hl["@punctuation.special"] = { fg = colors.fg_dark }
					hl["@operator"] = { fg = colors.fg_dark }
				end,
			})
		end,
	},
}
