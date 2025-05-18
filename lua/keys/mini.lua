local set_keymap = vim.keymap.set

set_keymap("n", "<C-F>", function()
	MiniFiles.open()
end)
