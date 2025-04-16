---@module "snacks"

---@param keymap string
---@param func function
---@param opts table
---@return table
local function make_snacks_mapping(keymap, func, opts)
	return vim.tbl_deep_extend("force", { [1] = keymap, [2] = func }, opts)
end

return {
	make_snacks_mapping("<space>b", function()
		Snacks.picker.buffers()
	end, { desc = "Pick buffers" }),
	make_snacks_mapping("<space>gg", function()
		Snacks.picker.grep()
	end, { desc = "Grep" }),
	make_snacks_mapping("<space>ch", function()
		Snacks.picker.command_history()
	end, { desc = "Command History" }),
	make_snacks_mapping("<space>f", function()
		Snacks.picker.files()
	end, { desc = "Find Files" }),
	-- find
	make_snacks_mapping("<space>cc", function()
		Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "Find Config File" }),
	make_snacks_mapping("<space>gf", function()
		Snacks.picker.git_files()
	end, { desc = "Find Git Files" }),
	make_snacks_mapping("<space>fr", function()
		Snacks.picker.recent()
	end, { desc = "Recent" }),
	-- git
	make_snacks_mapping("<space>gl", function()
		Snacks.picker.git_log()
	end, { desc = "Git Log" }),
	make_snacks_mapping("<leader>pgs", function()
		Snacks.picker.git_status()
	end, { desc = "Git Status" }),
	make_snacks_mapping("<leader>pgd", function()
		Snacks.picker.git_diff()
	end, { desc = "Git Diff" }),
	-- Grep
	make_snacks_mapping("<leader>pgl", function()
		Snacks.picker.lines()
	end, { desc = "Buffer Lines" }),
	make_snacks_mapping("<leader>pgb", function()
		Snacks.picker.grep_buffers()
	end, { desc = "Grep Open Buffers" }),
	make_snacks_mapping("<leader>pgg", function()
		Snacks.picker.grep()
	end, { desc = "Grep" }),
	make_snacks_mapping("<leader>pgw", function()
		Snacks.picker.grep_word()
	end, { desc = "Visual selection or word", mode = { "n", "x" } }),
	-- LSP
	make_snacks_mapping("ld", function()
		Snacks.picker.lsp_definitions()
	end, { desc = "Goto Definition" }),
	make_snacks_mapping("lr", function()
		Snacks.picker.lsp_references()
	end, { nowait = true, desc = "References" }),
	make_snacks_mapping("lI", function()
		Snacks.picker.lsp_implementations()
	end, { desc = "Goto Implementation" }),
	make_snacks_mapping("ltd", function()
		Snacks.picker.lsp_type_definitions()
	end, { desc = "Goto T[y]pe Definition" }),
	make_snacks_mapping("ls", function()
		Snacks.picker.lsp_symbols()
	end, { desc = "LSP Symbols" }),
	make_snacks_mapping("<leader>cs", function()
		Snacks.picker.colorschemes()
	end, { desc = "Choosing colorschemes." }),
}
