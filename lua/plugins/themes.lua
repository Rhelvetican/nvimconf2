return {
	{
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
	},

	{
		"catppuccin/nvim",
		lazy = false,
		priority = 9999,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				styles = {
					comments = { "italic" },
					keywords = { "italic" },
					variables = { "italic", "bold" },
					types = { "bold" },
					functions = { "italic", "bold" },
					miscs = { "italic" },
					properties = { "italic" },
				},

				integrations = {
					blink_cmp = true,
					cmp = true,
					dap = true,
					mason = true,
					mini = {},
					dap_ui = true,
					aerial = true,
					snacks = true,
					lsp_saga = true,
					telescope = true,
					which_key = true,
					treesitter = true,
					treesitter_context = true,
				},

				custom_highlights = function(color)
					return {
						Special = { fg = color.overlay2 },
					}
				end,
			})
		end,
	},

	{
		"nuvic/flexoki-nvim",
		name = "flextoki",
		lazy = false,
		priority = 9999,
		config = function()
			local palette = require("flexoki.palette")
			require("flexoki").setup({
				---@type table<string, Highlight?>
				highlight_groups = {
					Boolean = { fg = palette.magenta_two, bold = true, italic = true },
					Comment = { fg = palette.subtle, italic = true },
					Constant = { fg = palette.yellow_two, bold = true },
					Error = { fg = palette.red_two, bold = true },
					Exception = { fg = palette.blue_two, italic = true },
					Function = { fg = palette.orange_two, bold = true, italic = true },
					Keyword = { fg = palette.green_two, bold = true },
					Label = { fg = palette.cyan_two, bold = true },
					Macro = { fg = palette.purple_two, bold = true, italic = true },
					Number = { fg = palette.purple_two, bold = true, italic = true },
					Operator = { fg = palette.subtle, bold = true },
					String = { fg = palette.cyan_two, bold = true },
					Type = { fg = palette.cyan_two, bold = true, italic = true },

					["@keyword.repeat"] = { fg = palette.green_two, bold = true },
					["@keyword.return"] = { fg = palette.green_two, bold = true },
					["@keyword.exception"] = { fg = palette.green_two, bold = true },
					["@keyword.conditional"] = { fg = palette.green_two, bold = true },
					["@keyword.conditional.ternary"] = { fg = palette.green_two, bold = true },
				},
			})
		end,
	},
}
