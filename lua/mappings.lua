local map = vim.keymap.set

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

map("n", "<leader>ca", function()
	require("tiny-code-action").code_action({})
end, { noremap = true, silent = true })

map("n", "rn", function()
	vim.lsp.buf.rename()
end)

---@param msg string
---@return string
local function process_commit_message(msg)
	local escape_tbl = {
		["'"] = "\\'",
		[" "] = "\\ ",
		['"'] = '\\"',
	}

	local buf, gsub = "", string.gsub
	for pat, to in pairs(escape_tbl) do
		if buf == "" then
			buf = gsub(msg, pat, to)
		else
			buf = gsub(buf, pat, to)
		end
	end

	return buf
end

local function git_commit()
	local message = vim.fn.input("Enter commit messages: ")
	vim.cmd(":Git add -A")
	vim.cmd(":Git commit -m " .. process_commit_message(message))

	if vim.fn.input("Push? [y/n]\n"):lower() == "y" then
		vim.cmd(":Git push")
	end
end

map_nvo("ggg", git_commit)
map_nvo("ggp", function()
	vim.cmd(":Git pull")
end)

map_nvo("<leader>tt", function()
	Snacks.terminal.get()
end)
