---@module "lazy"
---@type LazySpec
return {
	{
		"rktjmp/lush.nvim",
	},

	{
		"arturgoms/moonbow.nvim",
		priority = 1000,

		config = function()
			require("moonbow").setup({
				---@type table<string,vim.api.keyset.highlight>
				overrides = {
					Delimiter = { link = "MoonbowFg4" },
					["@punctuation.special"] = { link = "@punctuation.bracket" },
					SpecialKey = { link = "@punctuation.bracket" },
				},
			})
		end,
	},

	{
		"Mofiqul/vscode.nvim",
		priority = 1000,

		config = function()
			require("vscode").setup({
				italic_comments = true,
				terminal_colors = true,
			})
		end,
	},

	{
		"hyperb1iss/silkcircuit-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("silkcircuit").setup({
				integrations = {
					treesitter = true,
					lsp = true,
					telescope = true,
					nvimtree = true,
					neotree = true,
					gitsigns = true,
					indent_blankline = true,
					bufferline = true,
					lualine = true,
					dashboard = true,
					alpha = true,
					which_key = true,
					cmp = true,
					notify = true,
					noice = true,
					hop = true,
					leap = true,
					lazy = true,
					mason = true,
					nvim_dap = true,
					trouble = true,
					outline = true,
					illuminate = true,
					flash = true,
					rainbow_delimiters = true,
				},

				on_highlights = function(hl, _)
					hl.Delimiter = hl["@punctuation.special"]
					hl.SpecialKey = hl["@punctuation.special"]
				end,
			})
		end,
	},
}
