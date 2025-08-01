---@type LazySpec
return {
	"FelipeLema/lazydev.nvim",
	ft = "lua",
	priority = 9999,

	dependencies = {
		{ "LuaCATS/luassert", name = "luassert-types", lazy = true },
		{ "LuaCATS/busted", name = "busted-types", lazy = true },
		{ "Bilal2453/luvit-meta", name = "luvit-types", lazy = true },
	},

	opts = {
		"lazy.nvim",
		{ path = "luassert-types/library", words = { "assert" } },
		{ path = "luvit-types/library", words = { "vim%.uv" } },
		{ path = "busted-types/library", words = { "describe" } },
		{ path = vim.env.VIMRUNTIME, words = { "vim" } },
	},
}
