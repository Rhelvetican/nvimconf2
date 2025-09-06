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
	Snacks.input.input({
		prompt = "Rename item to",
		function(input)
			if input then
				vim.lsp.buf.rename(input)
			end
		end,
	})
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

---@param msg string
local function commit(msg)
	vim.cmd(":Git add -A")
	vim.cmd(":Git commit -m " .. process_commit_message(msg))

	Snacks.input.input({ prompt = "Push Commit? [y/n] " }, function(confirmation)
		if confirmation and confirmation:lower() == "y" then
			vim.cmd(":Git push")
		end
	end)
end

local function git_commit()
	Snacks.input.input({ prompt = "Enter Commit Message: " }, function(input)
		if input then
			local success, msg = pcall(commit, input)

			if not success and type(msg) == "string" then
				vim.notify("Failed to commit and/or push changes.", vim.log.levels.ERROR)
			end
		end
	end)
end

map_nvo("ggg", git_commit)
map_nvo("ggp", function()
	local success, msg = pcall(vim.cmd, ":Git pull")

	if not success and type(msg) == "string" then
		vim.notify("Failed to pull changes.", vim.log.levels.ERROR)
	end
end)

map_nvo("<leader>tt", function()
	Snacks.terminal.get()
end)
