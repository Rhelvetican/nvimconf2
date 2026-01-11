---@type LazySpec
return {
	{
		"Rhelvetican/lemons.nvim",
		lazy = false,
		priority = 1000,
		config = function() end,
	},

	{
		"sainnhe/everforest",
	},

	{
		"uhs-robert/oasis.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("oasis").setup({
				style = "cactus",
			})
		end,
	},
}
