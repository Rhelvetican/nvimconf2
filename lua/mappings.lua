local map = vim.keymap.set

local function map_nvo(keybind, command)
	map({ "n", "v", "o" }, keybind, command)
end

map_nvo("<C-s>", "<cmd>w<CR>")

-- Plugins
map_nvo("<C-o>", "<cmd> Oil <CR>")
map_nvo("<C-l>", "<cmd> Lazy <CR>")
map_nvo("<C-m>", "<cmd> Mason <CR>")

map_nvo("<leader>tt", "<cmd> tab terminal <CR>")
map_nvo("<leader>ff", "<cmd> Tele find_files <CR>")
map_nvo("<leader>fo", "<cmd> Tele oldfiles <CR>")
map_nvo("<leader>fw", "<cmd> Tele live_grep <CR>")
map_nvo("<leader>g", "<cmd> Tele git_status <CR>")
