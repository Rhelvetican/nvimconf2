---@module "lazy"
---@type LazySpec[]
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
		"ramojus/mellifluous.nvim",

		config = function()
			require("mellifluous").setup({})
		end,
	},

	{
		"ficcdaf/ashen.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style_presets = {
				bold_functions = true,
				italic_comments = true,
			},

			hl = {
				---@type table<string, HighlightSpec>
				force_override = {
					SpecialKey = { "g_6" },
					["@punctuation.special"] = { "g_6" },
				},
			},
		},
	},
}
