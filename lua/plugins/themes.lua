---@module "lazy"
---@type LazySpec
return {
	{
		"rktjmp/lush.nvim",
		dependencies = {
			"rktjmp/shipwright.nvim",
		},
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,

		config = function()
			require("tokyonight").setup({
				on_highlights = function(hl, _)
					hl["@punctuation.bracket"] = hl.Special
				end,
			})
		end,
	},
}
