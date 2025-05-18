---@module "lazy"
---@type LazySpec
return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("configs.mini")
		end,
	},

	{
		"folke/snacks.nvim",
		event = "VimEnter",
		opts = require("configs.snacks"),
		keys = require("keys.snacks"),
	},

	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		priority = 1000,

		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "ghost",
			})

			vim.diagnostic.config({ virtual_text = false })
		end,
	},
}
