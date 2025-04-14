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

		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

			lsp.config(server, config)
			lsp.enable(server)
		end
	end,
}
