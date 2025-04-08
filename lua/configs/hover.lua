local map = vim.keymap.set

map("n", "K", require("hover").hover, { desc = "hover.nvim" })
map("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
map("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })

map("n", "<C-p>", function()
	require("hover").hover_switch("previous", {})
end, { desc = "hover.nvim (previous source)" })

map("n", "<C-n>", function()
	require("hover").hover_switch("next", {})
end, { desc = "hover.nvim (next source)" })

require("hover").setup({
	init = function()
		require("hover.providers.lsp")
		require("hover.providers.diagnostic")
	end,

	preview_opts = {
		border = "rounded",
	},

	title = true,
	mouse_providers = {
		"LSP",
	},

	mouse_delay = 250,
})
