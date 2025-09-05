return {
	-- Useful
	{
		"<leader><space>",
		function()
			Snacks.picker.smart()
		end,
		desc = "Smart Find Files",
	},
	{
		"<leader>,",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<leader>/",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>:",
		function()
			Snacks.picker.command_history()
		end,
		desc = "Command History",
	},
	{
		"<leader>n",
		function()
			Snacks.picker.notifications()
		end,
		desc = "Notification History",
	},
	{
		"<leader>e",
		function()
			Snacks.explorer()
		end,
		desc = "File Explorer",
	},

	-- LSP
	{
		"ld",
		function()
			Snacks.picker.lsp_definitions()
		end,
		desc = "Goto Definition",
	},

	-- LSP
	{
		"lr",
		function()
			Snacks.picker.lsp_references()
		end,
		nowait = true,
		desc = "References",
	},
	{
		"li",
		function()
			Snacks.picker.lsp_implementations()
		end,
		desc = "Goto Implementation",
	},
	{
		"lt",
		function()
			Snacks.picker.lsp_type_definitions()
		end,
		desc = "Goto T[y]pe Definition",
	},
	{
		"ls",
		function()
			Snacks.picker.lsp_symbols()
		end,
		desc = "LSP Symbols",
	},

	-- Colorschemes
	{
		"cs",
		function()
			Snacks.picker.colorschemes()
		end,
		desc = "Choosing colorschemes.",
	},
}
