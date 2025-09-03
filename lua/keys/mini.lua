local set_keymap = vim.keymap.set

set_keymap("n", "<C-f>", function()
	MiniFiles.open()
end)
