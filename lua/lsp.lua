---@type string[]
local lsps = {
	"clangd",
	"denols",
	"harper_ls",
	"jdtls",
	"jsonls",
	"nushell",
	"lua_ls",
	"ruff",
	"taplo",
	"tinymist",
	"ty",
	"zls",
}

local config, enable = vim.lsp.config, vim.lsp.enable
for _, server in ipairs(lsps) do
	local ok, res = pcall(require, string.format("lsp.%s", server))

	if ok then
		---@diagnostic disable-next-line: undefined-field
		config(server, vim.tbl_deep_extend("force", config[server] or {}, res))
	end

	enable(server)
end
