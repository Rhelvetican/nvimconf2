return {
	"saghen/blink.cmp",

	dependencies = {
		"saghen/blink.compat",
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
	},

	version = "*",

	opts = require("configs.blink"),

	opts_extend = { "sources.default" },
}
