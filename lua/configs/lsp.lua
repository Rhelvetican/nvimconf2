---@module "vim.lsp"
---@type table<string, vim.lsp.Config>
local C = {}

local lsp = vim.lsp

---@return lsp.ClientCapabilities
local function make_emmylua_ls_capabilities()
	local cap = require("blink-cmp").get_lsp_capabilities(lsp.protocol.make_client_capabilities(), true)

	return cap
end

C["emmylua_ls"] = {
	cmd = { "emmylua_ls" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".emmyrc.json", ".emmyrc.jsonc" },
	capabilities = make_emmylua_ls_capabilities(),

	settings = {
		runtime = {
			version = "Lua5.1",
		},
	},
}

for server, config in pairs(C) do
	lsp.config(server, config)
	lsp.enable(server)
end

return C
