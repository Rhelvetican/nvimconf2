return {
	{
		"vyfor/cord.nvim",
		branch = "client-server",
		build = ":Cord update",
		opts = function()
			require("configs.cord")
		end,
	},
}
