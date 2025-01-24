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
	},

	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
}
