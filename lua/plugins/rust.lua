require("config.rustaceanvim")

vim.pack.add({
	"https://github.com/rust-lang/rust.vim",
	{ src = "https://github.com/mrcjkb/rustaceanvim", version = vim.version.range("9.*") },
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.rs" },
	callback = function()
		vim.pack.add({
			{ src = "https://github.com/nvim-neotest/nvim-nio", name = "nio" },
			"https://github.com/nvim-lua/plenary.nvim",
			"https://github.com/antoinemadec/FixCursorHold.nvim",
			"https://github.com/nvim-neotest/neotest",
		})

		vim.g.rustaceanvim = {}

		require("nio")
		require("plenary")

		---@diagnostic disable-next-line: missing-fields
		require("neotest").setup({ adapters = { ["rustaceanvim.neotest"] = {} } })
	end,
})
