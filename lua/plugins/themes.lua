---@module "lazy"
---@type LazySpec[]
return {
	{
		"rktjmp/lush.nvim",
	},

	{
		"arturgoms/moonbow.nvim",
		priority = 9999,

		config = function()
			local colors = require("moonbow.colors").colors
			require("moonbow").setup({
				---@type table<string,vim.api.keyset.highlight>
				overrides = {
					Delimiter = { link = "MoonbowFg4" },
					["@punctuation.special"] = { link = "@punctuation.bracket" },
					SpecialKey = { link = "@punctuation.bracket" },
				},
			})
		end,
	},

	{
		"forest-nvim/sequoia.nvim",
		lazy = false,
		priority = 1000,
		config = function() end,
	},
}
