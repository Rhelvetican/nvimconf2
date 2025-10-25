---@module "lazy"
---@type LazySpec
return {
	{
		"akinsho/bufferline.nvim",
		event = "BufReadPre",
		opts = require("configs.bufferline"),
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = require("configs.telescope"),
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

		---@type snacks.Config
		opts = {
			dashboard = {},
			indent = { animate = { enabled = false }, chunk = { enabled = true } },
			input = {},
			picker = {},
			statuscolumn = {},
			terminal = { win = { border = "rounded" } },
			words = {},
		},

		keys = require("keys.snacks"),

		init = function()
			require("snacks")
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
			backend = "vim",
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

	{
		"Mythos-404/xmake.nvim",
		version = "^3",
		lazy = true,
		event = "BufReadPost",
		config = true,
	},

	{
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		version = "1.*",

		opts = {
			open_cmd = "start %s",
		},
	},
}
