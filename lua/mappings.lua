local map = vim.keymap.set

---@param keybind string
---@param command string|fun()
local function map_nvo(keybind, command)
	map({ "n", "v", "o" }, keybind, command)
end

map_nvo("<C-s>", "<cmd>w<CR>")
map_nvo("<C-c>", "<cmd>%y+<CR>")
map_nvo("d<leader>", "<cmd>%d+<CR>")

-- Plugins
map_nvo("<leader>ff", "<cmd> Tele find_files <CR>")
map_nvo("<leader>fo", "<cmd> Tele oldfiles <CR>")
map_nvo("<leader>fw", "<cmd> Tele live_grep <CR>")
map_nvo("<leader>g", "<cmd> Tele git_status <CR>")

map_nvo("tt", function()
	Snacks.terminal.toggle({ "nu" }, {})
end)

map("n", "<leader>ca", function()
	require("tiny-code-action").code_action({})
end, { noremap = true, silent = true })

map_nvo("<leader>rn", function()
	Snacks.input.input({
		prompt = "Rename item to",
		expand = true,
	}, function(input)
		if input then
			vim.lsp.buf.rename(input)
		end
	end)
end)

map_nvo("<leader>fg", Snacks.picker.grep)

-- Orelly!

local gitui = require("gitui")
gitui.setup()

map_nvo("gt", gitui.toggle)
