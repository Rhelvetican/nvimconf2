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

	{
		"charm-and-friends/freeze.nvim",
		config = function()
			require("freeze").setup({
				command = "freeze",
				open = true,
				output = function()
					return "./" .. os.date("%Y-%m-%d") .. "_freeze.png"
				end,
				theme = "catppuccin-mocha",
				font = {
					ligatures = true,
				},
			})
		end,
	},
}
