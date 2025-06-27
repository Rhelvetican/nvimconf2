---@module "lazy"
---@type LazySpec
return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

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
		"monaqa/dial.nvim",

		config = function()
			require("configs.dial")
		end,
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

	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"folke/snacks.nvim",
				opts = {
					terminal = {},
				},
			},
		},
		event = "LspAttach",
		opts = {
			picker = {
				"buffer",
				opts = {
					hotkeys = true,
				},
			},
		},
	},

	{
		"rachartier/tiny-glimmer.nvim",
		event = "VeryLazy",
		priority = 3,

		config = function()
			require("tiny-glimmer").setup({
				support = {
					overwrite = {
						search = {
							enabled = true,
						},
					},

					substitute = {
						enabled = false,
						default_animation = "fade",
					},
				},
			})
		end,
	},

	{
		"gbprod/yanky.nvim",
		opts = {
			highlight = {
				on_put = false,
				on_yank = false,
				timer = 150,
			},
		},
	},

	{
		"gbprod/substitute.nvim",
		config = function()
			require("substitute").setup({
				on_substitute = require("tiny-glimmer.support.substitute").substitute_cb,
				highlight_substituted_text = {
					enabled = false,
				},
			})
		end,
	},
}
