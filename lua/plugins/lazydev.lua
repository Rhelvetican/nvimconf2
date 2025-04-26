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
				{ path = "${3rd}/luv/library" },
				{ plugins = "nvim-dap-ui", types = true },

				{
					path = "~/AppData/Local/nvim-data/mason/packages/lua-language-server/LLS-Addons/addons/xmake/module/library/",
					files = { "xmake.lua" },
				},
			},
		},
	},
}
