vim.keymap.set("n", "<leader>tP", function()
	local buf = vim.api.nvim_buf_get_name(0)
	vim.lsp.buf_request(0, "workspace/executeCommand", { command = "tinymist.pinMain", arguments = { buf } })
end)

return {
	filetypes = { "typst", "typ" },
	single_file_support = true,

	settings = {
		formatterMode = "typstyle",
		formatterPrintWidth = 196,
	},
}
