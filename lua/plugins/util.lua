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
		priority = 1000,

		config = function()
			vim.diagnostic.config({ virtual_text = false })
			require("tiny-inline-diagnostic").setup({
				preset = "ghost",

				options = {
					multilines = {
						enabled = true,
						always_show = true,
					},
				},
			})
		end,
	},
}
