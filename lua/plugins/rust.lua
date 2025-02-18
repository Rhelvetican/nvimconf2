return {
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml", "BufRead cargo.toml" },
		dependencies = {
			"nvimtools/none-ls.nvim",
		},
		config = function()
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
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,

		dependencies = {
			"rust-lang/rust.vim",
		},

		ft = { "rust" },

		config = function()
			require("configs.rustaceanvim")
		end,
	},
}
