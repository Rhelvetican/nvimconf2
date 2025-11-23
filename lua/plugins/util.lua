---@type LazySpec
return {
	{
		"akinsho/bufferline.nvim",
		event = "BufReadPre",
		opts = {
			options = {
				themable = true,
				offsets = {
					{ filetype = "NvimTree", highlight = "NvimTreeNormal" },
				},
			},
		},
	},

	{
		"saghen/blink.indent",
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
		"Bekaboo/dropbar.nvim",

		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},

		config = function()
			local dropbar_api = require("dropbar.api")
			vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
			vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
			vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
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
