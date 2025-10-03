local map = vim.keymap.set

---@param keybind string
---@param command string|fun()
local function map_nvo(keybind, command)
	map({ "n", "v", "o" }, keybind, command)
end

map_nvo("<C-s>", "<cmd>w<CR>")
map_nvo("<C-c>", "<cmd>%y+<CR>")
map_nvo("d<leader>", "<cmd>%d+<CR>")
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

local gitui = require("gitui")
gitui.setup()

map_nvo("gt", gitui.toggle)

map_nvo("<leader>fg", Snacks.picker.grep)
map({ "n" }, "<C-k>", vim.lsp.buf.hover)
