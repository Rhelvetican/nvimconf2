---@module "lazy"
---@type LazySpec[]
return {
	{
		"rktjmp/lush.nvim",
	},

	{
		"ficcdaf/ashen.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style_presets = {
				bold_functions = true,
				italic_comments = true,
			},

			hl = {
				force_override = {
					SpecialKey = { "g_6" },
					["@punctuation.special"] = { "g_6" },
				},
			},
		},
	},

	{
		"Shatur/neovim-ayu",
		priority = 9999,

		config = function()
			require("ayu").setup({
				mirage = false,
				terminal = true,

				overrides = {},
			})
		end,
	},
}
