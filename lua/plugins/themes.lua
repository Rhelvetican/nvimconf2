return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 9999,
		config = function()
			require("onedarkpro").setup({
				styles = {
					types = "italic,bold",
					methods = "italic,bold",
					numbers = "bold",
					strings = "bold",
					comments = "italic",
					keywords = "italic,bold",
					constants = "italic,bold",
					functions = "italic,bold",
					operators = "bold",
					variables = "italic,bold",
					parameters = "italic",
					conditionals = "italic,bold",
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
					conditionals = { "italic", "bold" },
					loops = { "italic", "bold" },
					functions = { "italic", "bold" },
					keywords = { "italic", "bold" },
					variables = { "italic", "bold" },
					strings = { "bold" },
					numbers = { "bold" },
					booleans = { "bold" },
					properties = { "italic", "bold" },
					types = { "italic", "bold" },
					operators = { "bold" },
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

				color_overrides = {
					all = {
						base = "#0E0E1E",
						mantle = "#0E0E1E",
						crust = "#0E0E1E",
					},
				},

				custom_highlights = function(color)
					return {
						Special = { fg = color.overlay2 },
					}
				end,
			})
		end,
	},
}
