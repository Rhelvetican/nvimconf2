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
					variables = { "italic" },
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
					dap_ui = true,
					aerial = true,
					snacks = true,
					lsp_saga = true,
					telescope = true,
					which_key = true,
					treesitter = true,
					treesitter_context = true,
				},
			})
		end,
	},

	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 9999,
		config = function()
			require("poimandres").setup({})
		end,
	},

	{
		"nuvic/flexoki-nvim",
		name = "flextoki",
		config = function()
			local palette = require("flexoki.palette")
			require("flexoki").setup({
				---@type table<string, Highlight?>
				highlight_groups = {
					Type = { fg = palette.cyan_two, bold = true },
					Keyword = { fg = palette.green_two, italic = true },
					Constant = { fg = palette.yellow_two, bold = true },
					Function = { fg = palette.orange_two, italic = true, bold = true },
					Identifier = { fg = palette.text, italic = true },
				},
			})
		end,
	},
}
