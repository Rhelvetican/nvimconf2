vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	{ src = "https://github.com/nvim-mini/mini.nvim", version = vim.version.range("*") },
	"https://github.com/saghen/blink.indent",
	"https://github.com/akinsho/bufferline.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/rachartier/tiny-glimmer.nvim",
})

require("config.mini")

require("bufferline").setup({
	options = {
		themable = true,
		offsets = {
			{ filetype = "NvimTree", highlight = "NvimTreeNormal" },
		},
	},
})

require("snacks").setup({
	input = {},
	picker = {},
	statuscolumn = {},
	terminal = { win = { border = "rounded" } },
	words = {},
})

vim.api.nvim_create_autocmd("BufEnter", {
	once = true,
	callback = function()
		vim.diagnostic.config({ virtual_text = false })
		vim.pack.add({ "https://github.com/rachartier/tiny-inline-diagnostic.nvim" })
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
})

vim.api.nvim_create_autocmd("LspAttach", {
	once = true,
	callback = function()
		vim.pack.add({ "https://github.com/rachartier/tiny-code-action.nvim" })
		require("tiny-code-action").setup({
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
		})
	end,
})

require("tiny-glimmer").setup({
	enable = true,
	disable_warnings = true,

	hijack_ft_disabled = { "alpha" },
})
