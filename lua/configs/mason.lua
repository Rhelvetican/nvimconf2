require("mason").setup({
	ensure_installed = {
		"ast-grep",
		"bacon",
		"bacon-ls",
		"clang-format",
		"clangd",
		"codelldb",
		"cpplint",
		"cpptools",
		"lua-language-server",
		"pylyzer",
		"ruff",
		"rust-analyzer",
		"stylua",
		"taplo",
	},

	log_level = 3,

	ui = {
		keymaps = {
			apply_language_filter = "<leader>mf",
			cancel_installation = "<leader>mc",
			toggle_package_install_log = "<leader>ml",
		},
	},
})
