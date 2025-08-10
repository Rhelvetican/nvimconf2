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
					hl.Special = hl["@punctuation.bracket"]
					hl.SpecialKey = hl.Special
					hl["@punctuation.special"] = hl.Special
					hl["@punctuation.special.markdown"] = hl.Special
				end,
			})
		end,
	},
}
