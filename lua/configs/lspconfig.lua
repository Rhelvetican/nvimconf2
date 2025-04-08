require("configs.lsp")

---@module "lspconfig"
local M = {}

local servers = {}

local function register(name, config)
	servers[name] = config or {}
end

register("clangd")
register("taplo")
register("ast_grep")
register("lua_ls")
register("marksman")
register("nushell")
register("jsonls")

register("neocmake")
register("cmake")

register("denols", {
	settings = {
		deno = {
			inlayHints = {
				parameterNames = {
					enabled = "all",
				},
				parameterTypes = {
					enabled = true,
				},
				variableTypes = {
					enabled = true,
				},
				propertyDeclarationTypes = {
					enabled = true,
				},
				functionLikeReturnTypes = {
					enabled = true,
				},
				enumMemberValues = {
					enabled = true,
				},
			},
		},
	},
})

register("basedpyright", {
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
})

register("ruff", {
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
})

register("sqls", {
	on_attach = function(client, bufnr)
		require("sqls").on_attach(client, bufnr)
	end,
})

M.servers = servers

return M
