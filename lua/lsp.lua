---@type string[]
local lsps = {
	"clangd",
	"denols",
	-- "emmylua_ls",
	"lua_ls",
	"glsl_analyzer",
	"jsonls",
	"nushell",
	"ruff",
	"taplo",
	"tinymist",
	"ty",
	"zls",
}

for _, server in ipairs(lsps) do
	vim.lsp.enable(server)
end
