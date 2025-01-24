return {
	"folke/lazydev.nvim",

	opts = {
		library = {
			"lazy.nvim",
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		},
	},
}
