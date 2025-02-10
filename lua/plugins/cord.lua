return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	opts = function()
		require("configs.cord")
	end,
}
