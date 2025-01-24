return {
	"saghen/blink.cmp",
	dependencies = {
		"saghen/blink.compat",
		"rafamadriz/friendly-snippets",
	},
	version = "*",
	opts = require("configs.blink"),
	opts_extend = { "sources.default" },
}
