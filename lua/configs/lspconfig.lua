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

servers.denols = {
	root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

servers.ts_ls = {
	root_dir = lsp.util.root_pattern("package.json"),
	single_file_support = true,
}

M.servers = servers

return M
