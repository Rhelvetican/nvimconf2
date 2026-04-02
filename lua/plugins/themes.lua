vim.pack.add({
    "https://www.github.com/folke/tokyonight.nvim",
})


require("tokyonight").setup({
    style = "moon",
    on_highlights = function(highlights, colors)
        highlights["@punctuation.bracket"] = { fg = colors.blue5 }
    end,
})
