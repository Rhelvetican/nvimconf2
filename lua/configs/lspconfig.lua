local lsp = require("lspconfig")

local M = {}
---@type table<string, lspconfig.Config?>
local servers = {}

servers.clangd = {}
servers.taplo = {}
servers.jsonls = {}
servers.ast_grep = {}
servers.lua_ls = {}
servers.marksman = {}
servers.denols = {}
servers.ts_ls = {}

servers.basedpyright = {
	settings = {
		basedpyright = {
			disableOrganizeImports = false,
			disableTaggedHints = false,

			analysis = {
				typeCheckingMode = "standard",
				useLibraryCodeForTypes = true,
				autoImportCompletions = true,
				autoSearchPaths = true,

				inlayHints = {
					genericTypes = true,
				},
			},
		},
	},
}

servers.ruff = {
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
}

servers.sqls = {
	on_attach = function(client, bufnr)
		require("sqls").on_attach(client, bufnr)
	end,
}

M.servers = servers

return M
