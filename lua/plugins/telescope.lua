return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",

		dependencies = { "nvim-lua/plenary.nvim" },
		opts = require("configs.telescope"),
	},
}
