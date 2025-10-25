return {
	"neovim/nvim-lspconfig",
	priority = 1000,

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local opts = require("configs.lspconfig")
		local lsp = require("vim.lsp")

		for server, cfg in pairs(opts) do
			lsp.config(server, cfg or {})
			lsp.enable(server)
		end
	end,
}
