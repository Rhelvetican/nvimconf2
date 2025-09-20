---@type LazySpec
return {
	"folke/lazydev.nvim",
	ft = "lua",
	priority = 9999,

	dependencies = {},

	opts = {
		"lazy.nvim",
		{ path = vim.env.VIMRUNTIME, words = { "vim" } },
	},
}
