---@type LazySpec
return {
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

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				flavour = "mocha",

				lsp_styles = {
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
						ok = { "undercurl" },
					},
				},

				highlight_overrides = {
					all = function(_)
						return {
							Special = { link = "@punctuation.bracket" },
							SpecialKey = { link = "Special" },
							["@punctuation.special"] = { link = "Special" },
							["@punctuation.special.markdown"] = { link = "Special" },
						}
					end,
				},

				auto_integrations = true,
			})
		end,
	},
}
