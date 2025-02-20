---@module "snacks"
return {
	{
		"<C-p>b",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<C-p>rg",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep",
	},
	{
		"<C-p>ch",
		function()
			Snacks.picker.command_history()
		end,
		desc = "Command History",
	},
	{
		"<C-p>ff",
		function()
			Snacks.picker.files()
		end,
		desc = "Find Files",
	},
	-- find
	{
		"<C-p>fc",
		function()
			Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Find Config File",
	},
	{
		"<C-p>fg",
		function()
			Snacks.picker.git_files()
		end,
		desc = "Find Git Files",
	},
	{
		"<C-p>fr",
		function()
			Snacks.picker.recent()
		end,
		desc = "Recent",
	},
	-- git
	{
		"<C-p>gl",
		function()
			Snacks.picker.git_log()
		end,
		desc = "Git Log",
	},
	{
		"<C-p>gs",
		function()
			Snacks.picker.git_status()
		end,
		desc = "Git Status",
	},
	{
		"<C-p>gd",
		function()
			Snacks.picker.git_diff()
		end,
		desc = "Git Diff",
	},
	-- Grep
	{
		"<C-p>gl",
		function()
			Snacks.picker.lines()
		end,
		desc = "Buffer Lines",
	},
	{
		"<C-p>gb",
		function()
			Snacks.picker.grep_buffers()
		end,
		desc = "Grep Open Buffers",
	},
	{
		"<C-p>gg",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep",
	},
	{
		"<C-p>gw",
		function()
			Snacks.picker.grep_word()
		end,
		desc = "Visual selection or word",
		mode = { "n", "x" },
	},
	-- search
	{
		"<C-p>sr",
		function()
			Snacks.picker.registers()
		end,
		desc = "Registers",
	},
	{
		"<C-p>sa",
		function()
			Snacks.picker.autocmds()
		end,
		desc = "Autocmds",
	},
	{
		"<C-p>sC",
		function()
			Snacks.picker.command_history()
		end,
		desc = "Command History",
	},
	{
		"<C-p>sc",
		function()
			Snacks.picker.commands()
		end,
		desc = "Commands",
	},
	{
		"<C-p>sd",
		function()
			Snacks.picker.diagnostics()
		end,
		desc = "Diagnostics",
	},
	{
		"<C-p>sh",
		function()
			Snacks.picker.help()
		end,
		desc = "Help Pages",
	},
	{
		"<C-p>sH",
		function()
			Snacks.picker.highlights()
		end,
		desc = "Highlights",
	},
	{
		"<C-p>sj",
		function()
			Snacks.picker.jumps()
		end,
		desc = "Jumps",
	},
	{
		"<C-p>sk",
		function()
			Snacks.picker.keymaps()
		end,
		desc = "Keymaps",
	},
	{
		"<C-p>sl",
		function()
			Snacks.picker.loclist()
		end,
		desc = "Location List",
	},
	{
		"<C-p>sM",
		function()
			Snacks.picker.man()
		end,
		desc = "Man Pages",
	},
	{
		"<C-p>sm",
		function()
			Snacks.picker.marks()
		end,
		desc = "Marks",
	},
	{
		"<C-p>sR",
		function()
			Snacks.picker.resume()
		end,
		desc = "Resume",
	},
	{
		"<C-p>sq",
		function()
			Snacks.picker.qflist()
		end,
		desc = "Quickfix List",
	},
	{
		"<C-p>qp",
		function()
			Snacks.picker.projects()
		end,
		desc = "Projects",
	},
	-- LSP
	{
		"<C-p>gd",
		function()
			Snacks.picker.lsp_definitions()
		end,
		desc = "Goto Definition",
	},
	{
		"<C-p>gr",
		function()
			Snacks.picker.lsp_references()
		end,
		nowait = true,
		desc = "References",
	},
	{
		"<C-p>gI",
		function()
			Snacks.picker.lsp_implementations()
		end,
		desc = "Goto Implementation",
	},
	{
		"<C-p>gy",
		function()
			Snacks.picker.lsp_type_definitions()
		end,
		desc = "Goto T[y]pe Definition",
	},
	{
		"<C-p>ss",
		function()
			Snacks.picker.lsp_symbols()
		end,
		desc = "LSP Symbols",
	},
	{
		"<leader>tt",
		function()
			Snacks.picker.colorschemes()
		end,
		desc = "Choosing colorschemes.",
	},
}
