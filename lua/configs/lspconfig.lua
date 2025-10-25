local M = {}

---@param tbl {[string]: vim.lsp.Config|table<string, any>|"default"}
function register(tbl)
	for server, config in pairs(tbl) do
		local ok, cfg = pcall(require, "lspconfig.configs." .. server)

		if ok and type(cfg) == "table" then
			if type(config) == "string" then
				M[server] = cfg
			else
				M[server] = vim.tbl_deep_extend("force", cfg, config)
			end
		else
			M[server] = (type(config) == "string") and {} or config
		end
	end
end

register({
	basedpyright = "default",

	clangd = {
		cmd = { "clangd", "--clang-tidy", "--background-index" },
	},

	denols = {
		settings = {
			deno = {
				inlayHints = true,
			},
		},
	},

	emmylua_ls = "default",

	glsl_analyzer = {
		filetypes = { "glsl", "vert", "tesc", "tese", "frag", "geom", "comp", "fs" },
	},

	jsonls = "default",

	marksman = "default",

	nushell = "default",

	ruff = {
		on_attach = function(client, _)
			client.server_capabilities.hoverProvider = false
		end,
	},

	taplo = "default",

	tinymist = "default",

	zls = {
		filetypes = { "zig", "zir", "zon" },
		root_markers = { "zls.json", "build.zig", "build.zig.zon", ".git" },
		settings = {
			zls = {
				warn_style = true,
				semantic_tokens = "full",
			},
		},
	},
})

return M
