return {

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"j-hui/fidget.nvim",
			"saghen/blink.cmp",
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("mason-lspconfig").setup_handlers({
						-- Disable rust-analyzer here as rustaceanvim will set it up for us.
						["rust_analyzer"] = function() end,
					})
				end,
			},
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
