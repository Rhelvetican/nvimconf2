require("hover").setup({
	init = function()
		require("hover.providers.lsp")
		require("hover.providers.diagnostic")
	end,
	title = true,
	mouse_providers = {
		"LSP",
	},
	mouse_delay = 500,
})
