local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.lua_patterns = {
	install_info = {
		url = "https://github.com/OXY2DEV/tree-sitter-lua_patterns",
		files = { "src/parser.c" },
		branch = "main",
	},
}

require("nvim-treesitter.configs").setup({
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
