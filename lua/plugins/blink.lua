return {
	"saghen/blink.cmp",

	dependencies = {
		"saghen/blink.compat",
		{ "rafamadriz/friendly-snippets", event = "BufEnter" },
		{ "folke/lazydev.nvim", ft = "lua" },
	},

	version = "*",

	opts = require("configs.blink"),

	opts_extend = { "sources.default" },
}
