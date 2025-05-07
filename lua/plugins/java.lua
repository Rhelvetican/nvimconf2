---@module "lazy"
---@type LazySpec
return {
	"nvim-java/nvim-java",
	priority = 1001,

	ft = { "Java" },

	config = function()
		require("java").setup({})
	end,
}
