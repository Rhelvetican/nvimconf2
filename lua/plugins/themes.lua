vim.pack.add({
	"https://www.github.com/folke/tokyonight.nvim",
	"https://www.github.com/ellisonleao/gruvbox.nvim",
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("tokyonight").setup({
	style = "moon",

	lualine_bold = true,

	on_highlights = function(highlights, colors)
		highlights["Special"] = { fg = colors.blue5 }
		highlights["Identifier"] = vim.tbl_deep_extend("force", highlights["Identifier"], { bold = true })
		highlights["Function"] = vim.tbl_deep_extend("force", highlights["Function"], { bold = true })

		highlights["@punctuation.bracket"] = { fg = colors.blue5 }
		highlights["@keyword"] = vim.tbl_deep_extend("force", highlights["@keyword"], { bold = true })
	end,
})

require("gruvbox").setup({
	overrides = {},
})

require("catppuccin").setup({
	flavor = "mocha",

	no_underline = true,

	styles = {
		functions = { "italic", "bold" },
		keywords = { "italic" },
	},

	lsp_styles = {
		underlines = {
			errors = { "undercurl" },
			warnings = { "undercurl" },
		},
	},
})
