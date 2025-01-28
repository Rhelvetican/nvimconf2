return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"j-hui/fidget.nvim",
			"saghen/blink.cmp",
		},

		event = { "BufReadPre", "BufNewFile" },
		opts = require("configs.lspconfig"),

		config = function(_, opts)
			local lsp = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lsp[server].setup(config)
			end
		end,
	},
}
