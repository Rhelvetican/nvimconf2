---@module "lazy"
---@type LazySpec
return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	{
		"nvim-telescope/telescope.nvim",
		version = "*",

		dependencies = { "nvim-lua/plenary.nvim" },
		opts = require("configs.telescope"),
	},

	{
		"lewis6991/hover.nvim",

		config = function()
			require("configs.hover")
		end,
	},

	{
		"nvim-mini/mini.nvim",
		version = "*",
		config = function()
			require("configs.mini")
		end,
	},

	{
		"folke/snacks.nvim",
		event = "VimEnter",

		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			indent = { enabled = true, animate = { enabled = false }, chunk = { enabled = true } },
			input = { enabled = true },
			notifier = { enabled = true },
			picker = { enabled = true },
			statuscolumn = { enabled = true },
			terminal = { enabled = true },
			words = { enabled = true },
		},

		keys = require("keys.snacks"),

		config = function()
			require("configs.snacks")
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
		event = "LspAttach",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "folke/snacks.nvim", opts = { terminal = {} } },
		},
		opts = {
			backend = "delta",
			picker = "snacks",

			backend_opts = {
				delta = {
					header_lines_to_remove = 4,
					args = {
						"--line-numbers",
					},
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
						enabled = true,
						default_animation = "fade",
					},
				},
			})
		end,
	},
}
