local map = vim.keymap.set
local hover = require("hover")

local function checked_hover()
	local bufnr = vim.api.nvim_win_get_buf(0)
	local pos = vim.fn.getmousepos()

	local ok, lines = pcall(vim.api.nvim_buf_get_lines, bufnr, pos.line, pos.line + 1, true)

	if ok then
		if lines[1] then
			hover.hover_mouse()
		end
	end
end

map("n", "K", hover.hover, { desc = "hover.nvim" })
map("n", "gK", hover.hover_select, { desc = "hover.nvim (select)" })
map("n", "<MouseMove>", checked_hover, { desc = "hover.nvim (mouse)" })

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
