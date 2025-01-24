local map = vim.keymap.set

local function map_nvo(keybind, command)
	map({ "n", "v", "o" }, keybind, command)
end

map_nvo("<C-s>", "<cmd>w<CR>")

-- Plugins
map_nvo("<C-o>", "<cmd> Oil <CR>")
map_nvo("<C-l>", "<cmd> Lazy <CR>")
map_nvo("<C-m>", "<cmd> Mason <CR>")

-- Snacks
