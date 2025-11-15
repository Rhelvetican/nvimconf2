---@type string[]
local lsps = {
	"basedpyright",
	"clangd",
	"denols",
	"emmylua_ls",
	"glsl_analyzer",
	"jsonls",
	"marksman",
	"nushell",
	"ruff",
	"taplo",
	"tinymist",
	"zls",
}

for _, server in ipairs(lsps) do
	vim.lsp.enable(server)
end
