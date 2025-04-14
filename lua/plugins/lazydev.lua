---@module "lazydev"
return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		priority = 9999,

		---@type lazydev.Config
		opts = {
			library = {
				"lazy.nvim",
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				{ plugins = "nvim-dap-ui", types = true },
			},
		},
	},
}
