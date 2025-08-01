return {
	"neovim/nvim-lspconfig",
	priority = 1000,
	dependencies = {
		"j-hui/fidget.nvim",
		"saghen/blink.cmp",
	},

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local opts = require("configs.lspconfig")
		local lsp = require("vim.lsp")

		for server, cfg in pairs(opts.servers.servers) do
			cfg.capabilities = require("blink.cmp").get_lsp_capabilities(cfg.capabilities)

			lsp.config(server, cfg or {})
			lsp.enable(server)
		end
	end,
}
