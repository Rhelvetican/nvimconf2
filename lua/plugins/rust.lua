vim.pack.add({
	"https://github.com/rust-lang/rust.vim",
	{ src = "https://github.com/mrcjkb/rustaceanvim", version = vim.version.range("8.*") },
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
		require("neotest").setup({ adapters = { ["rustaceanvim.neotest"] = {} } })
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "Cargo.*", "cargo.*" },
	callback = function()
		vim.pack.add({
			"https://github.com/saecki/crates.nvim",
		})

		require("crates").setup({
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
			completion = {
				crates = {
					enabled = true,
					max_results = 8,
				},
			},
			autoload = true,
			autoupdate = true,
		})
	end,
})
