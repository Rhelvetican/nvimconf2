return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",

	opts = require("configs.trouble"),
	keys = require("keys.trouble"),
}
