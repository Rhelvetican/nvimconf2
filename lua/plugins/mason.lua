return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		lazy = false,
		cmd = { "Mason", "MasonInstall" },
		opts = function()
			require("configs.mason")
		end,
	},
}
