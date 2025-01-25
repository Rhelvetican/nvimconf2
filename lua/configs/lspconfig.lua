local M = {}
local servers = {}

servers.clangd = {}

servers.taplo = {}

servers.lua_ls = {}

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

M.servers = servers

return M
