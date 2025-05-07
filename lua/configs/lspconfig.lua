---@module "lspconfig"
local M = {}

-- require("configs.lsp")

local servers = {}

---@param name string
---@param config vim.lsp.Config?
local function register(name, config)
	local server_config = vim.tbl_deep_extend("keep", config or {}, require("lspconfig.configs." .. name))
	servers[name] = server_config
end

register("clangd")
register("lua_ls")
register("taplo")
register("marksman")
register("nushell")
register("jsonls")
register("neocmake")
register("jdtls")

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
