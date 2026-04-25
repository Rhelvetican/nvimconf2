local map = vim.keymap.set

---@param keybind string
---@param command string|fun()
---@param opts? vim.keymap.set.Opts
local function map_nvo(keybind, command, opts)
	map({ "n", "v", "o" }, keybind, command, opts)
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
		icon_hl = "SnacksInputIcon",
	}, function(input)
		if input then
			vim.lsp.buf.rename(input)
		end
	end)
end)

local lazygit = require("lazygit")
lazygit.setup()

map_nvo("lg", lazygit.toggle)

map_nvo("<leader>fg", Snacks.picker.grep, { desc = "Grep" })
map_nvo("<leader>cs", Snacks.picker.colorschemes, { desc = "Choosing colorschemes" })

map("n", "<C-k>", vim.lsp.buf.hover)
map("n", "<C-f>", MiniFiles.open)

map("n", "ff", function()
	if not _G.FFF then
		LOAD_FFF()
	end

	require("fff").find_files({ grep = { modes = { "fuzzy", "regex", "plain" } } })
end, { desc = "FFFind files" })
map("n", "fg", function()
	if not _G.FFF then
		LOAD_FFF()
	end

	require("fff").live_grep({ grep = { modes = { "fuzzy", "regex", "plain" } } })
end, { desc = "FFFLivegrep" })
