vim.pack.add({
	"https://www.github.com/folke/tokyonight.nvim",
	"https://github.com/ellisonleao/gruvbox.nvim",
})

require("tokyonight").setup({
	style = "moon",
	on_colors = function(_) end,
	on_highlights = function(highlights, colors)
		highlights["@punctuation.bracket"] = { fg = colors.blue5 }
	end,
})

require("gruvbox").setup({
	overrides = {},
})
