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
