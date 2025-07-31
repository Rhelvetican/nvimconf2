local M = {}

---@class Servers
local servers = {}

---@param name string
---@param config vim.lsp.Config?
function servers:register(name, config)
	local ok, val = pcall(require, "lspconfig.configs." .. name)

	if ok and type(val) ~= "string" and name ~= "register" then
		local server_config = vim.tbl_deep_extend("keep", config or {}, val)
		self[name] = server_config
	else
		self[name] = config or {}
	end
end

servers:register("clangd")

-- servers:register("lua_ls")
servers:register("emmylua_ls", {
	cmd = { "emmylua_ls" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".emmyrc.json",
		".luacheckrc",
		".git",
	},
	workspace_required = false,
})

servers:register("taplo")
servers:register("marksman")
servers:register("nushell")
servers:register("jsonls")

servers:register("denols", {
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

servers:register("basedpyright", {
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

servers:register("ruff", {
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
})

servers:register("sqls", {
	on_attach = function(client, bufnr)
		require("sqls").on_attach(client, bufnr)
	end,
})

servers:register("tinymist", {
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onType",
		semanticTokens = "disable",
	},
})

servers:register("glsl_analyzer", {
	cmd = { "glsl_analyzer" },
	filetypes = { "glsl", "vert", "tesc", "tese", "frag", "geom", "comp", "fs" },
	root_markers = { ".git" },
})

M.servers = servers

return M
