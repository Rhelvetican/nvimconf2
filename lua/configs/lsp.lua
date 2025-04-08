local lsp = vim.lsp

lsp.config["emmylua_ls"] = {
	cmd = { "emmylua_ls" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".emmyrc.json", ".emmyrc.jsonc" },
}
