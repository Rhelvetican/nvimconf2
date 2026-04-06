vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context", name = "treesitter-context" },
})

require("plugins.blink")
require("nvim-treesitter").setup({
	modules = {},
	sync_install = true,
	auto_install = true,

	ignore_install = {},
	ensure_installed = {},

	autotag = { enable = true },
	indent = { enable = true },
	highlight = {
		enable = true,
	},
})
