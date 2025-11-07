---@type LazySpec
return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		priority = 1000,

		config = function()
			vim.diagnostic.config({ virtual_text = false })
			require("tiny-inline-diagnostic").setup({
				preset = "ghost",

				options = {
					multilines = {
						enabled = true,
						always_show = true,
					},
				},
			})
		end,
	},

	{
		"rachartier/tiny-code-action.nvim",
		event = "LspAttach",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "folke/snacks.nvim", opts = { terminal = {} } },
		},
		opts = {
			backend = "vim",
			picker = "snacks",

			backend_opts = {
				delta = {
					header_lines_to_remove = 4,
					args = {
						"--line-numbers",
					},
				},
			},
		},
	},

	{
		"rachartier/tiny-glimmer.nvim",
		event = "VeryLazy",
		priority = 3,

		config = function()
			require("tiny-glimmer").setup({
				enable = true,
				disable_warnings = true,

				hijack_ft_disabled = {
					"alpha",
					"snacks_dashboard",
				},
			})
		end,
	},
}
