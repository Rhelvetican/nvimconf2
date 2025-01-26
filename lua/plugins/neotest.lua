return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},

		---@module "neotest"
		---@type neotest.Config
		opts = {
			adapter = {
				["rustaceanvim.neotest"] = {},
			},
		},
	},
}
