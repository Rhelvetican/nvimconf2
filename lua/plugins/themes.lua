---@type LazySpec
return {
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

	{
		"3dyuval/retro-fallout.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("retro-fallout").setup({})
		end,
	},
}
