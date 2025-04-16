---@module "snacks"

---@class SnacksKeymap
---@field desc string
---@field [1] string
---@field [2] function

---@param keymap string
---@param func function
---@param desc string
---@return SnacksKeymap
local function make_snacks_mapping(keymap, func, desc)
	return {
		keymap,
		func,
		desc = desc,
	}
end

return {
	make_snacks_mapping("<space>b", function()
		Snacks.picker.buffers()
	end, "Pick buffers"),
	make_snacks_mapping("<space>gg", function()
		Snacks.picker.grep()
	end, "Grep"),
	make_snacks_mapping("<space>ch", function()
		Snacks.picker.command_history()
	end, "Command History"),
	{
		"<space>f",
		function()
			Snacks.picker.files()
		end,
		desc = "Find Files",
	},
	-- find
	{
		"<space>cc",
		function()
			Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Find Config File",
	},
	{
		"<space>gf",
		function()
			Snacks.picker.git_files()
		end,
		desc = "Find Git Files",
	},
	{
		"<space>fr",
		function()
			Snacks.picker.recent()
		end,
		desc = "Recent",
	},
	-- git
	{
		"<space>gl",
		function()
			Snacks.picker.git_log()
		end,
		desc = "Git Log",
	},
	{
		"<leader>pgs",
		function()
			Snacks.picker.git_status()
		end,
		desc = "Git Status",
	},
	{
		"<leader>pgd",
		function()
			Snacks.picker.git_diff()
		end,
		desc = "Git Diff",
	},
	-- Grep
	{
		"<leader>pgl",
		function()
			Snacks.picker.lines()
		end,
		desc = "Buffer Lines",
	},
	{
		"<leader>pgb",
		function()
			Snacks.picker.grep_buffers()
		end,
		desc = "Grep Open Buffers",
	},
	{
		"<leader>pgg",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>pgw",
		function()
			Snacks.picker.grep_word()
		end,
		desc = "Visual selection or word",
		mode = { "n", "x" },
	},
	-- search
	{
		"<leader>psr",
		function()
			Snacks.picker.registers()
		end,
		desc = "Registers",
	},
	{
		"<leader>psa",
		function()
			Snacks.picker.autocmds()
		end,
		desc = "Autocmds",
	},
	{
		"<leader>psC",
		function()
			Snacks.picker.command_history()
		end,
		desc = "Command History",
	},
	{
		"<leader>psc",
		function()
			Snacks.picker.commands()
		end,
		desc = "Commands",
	},
	{
		"<leader>psd",
		function()
			Snacks.picker.diagnostics()
		end,
		desc = "Diagnostics",
	},
	{
		"<leader>psh",
		function()
			Snacks.picker.help()
		end,
		desc = "Help Pages",
	},
	{
		"<leader>psH",
		function()
			Snacks.picker.highlights()
		end,
		desc = "Highlights",
	},
	{
		"<leader>psj",
		function()
			Snacks.picker.jumps()
		end,
		desc = "Jumps",
	},
	{
		"<leader>psk",
		function()
			Snacks.picker.keymaps()
		end,
		desc = "Keymaps",
	},
	{
		"<leader>psl",
		function()
			Snacks.picker.loclist()
		end,
		desc = "Location List",
	},
	{
		"<leader>psM",
		function()
			Snacks.picker.man()
		end,
		desc = "Man Pages",
	},
	{
		"<leader>psm",
		function()
			Snacks.picker.marks()
		end,
		desc = "Marks",
	},
	{
		"<leader>psR",
		function()
			Snacks.picker.resume()
		end,
		desc = "Resume",
	},
	{
		"<leader>psq",
		function()
			Snacks.picker.qflist()
		end,
		desc = "Quickfix List",
	},
	{
		"<leader>pqp",
		function()
			Snacks.picker.projects()
		end,
		desc = "Projects",
	},
	-- LSP
	{
		"<leader>pgd",
		function()
			Snacks.picker.lsp_definitions()
		end,
		desc = "Goto Definition",
	},
	{
		"<leader>pgr",
		function()
			Snacks.picker.lsp_references()
		end,
		nowait = true,
		desc = "References",
	},
	{
		"<leader>pgI",
		function()
			Snacks.picker.lsp_implementations()
		end,
		desc = "Goto Implementation",
	},
	{
		"<leader>pgy",
		function()
			Snacks.picker.lsp_type_definitions()
		end,
		desc = "Goto T[y]pe Definition",
	},
	{
		"<leader>pss",
		function()
			Snacks.picker.lsp_symbols()
		end,
		desc = "LSP Symbols",
	},
	{
		"<leader>cs",
		function()
			Snacks.picker.colorschemes()
		end,
		desc = "Choosing colorschemes.",
	},
}
