vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	{ src = "https://github.com/nvim-mini/mini.nvim", version = vim.version.range("*") },
	"https://github.com/saghen/blink.indent",
	"https://github.com/akinsho/bufferline.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/rachartier/tiny-glimmer.nvim",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
	{ src = "https://github.com/goolord/alpha-nvim", name = "alpha" },
})

_G.LOAD_FFF = function(_)
	if not _G.FFF then
		vim.pack.add({ { src = "https://github.com/dmtrKovalenko/fff.nvim", version = vim.version.range("*") } })
		require("fff").setup({
			lazy_sync = true,
			grep = {
				modes = { "regex", "fuzzy", "plain" },
				trim_whitespace = true,
			},
		})

		_G.FFF = true
	end
end

require("config.mini")

require("bufferline").setup({
	options = {
		themable = true,
		offsets = {
			{ filetype = "NvimTree", highlight = "NvimTreeNormal" },
		},
	},
})

require("alpha").setup(require("config.alpha"))

require("snacks").setup({
	input = {},
	picker = {},
	statuscolumn = {},
	terminal = { win = { border = "rounded" } },
	words = {},
})

vim.diagnostic.config({ virtual_text = false })
require("tiny-inline-diagnostic").setup({
	preset = "simple",

	options = {
		multilines = {
			enabled = true,
			always_show = true,
		},
	},
})

vim.api.nvim_create_autocmd({ "DirChanged", "DirChangedPre" }, {
	once = true,
	callback = LOAD_FFF,
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind

		if name == "fff" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("fff")
			end

			require("fff.download").download_or_build_binary()
		end
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.typ", "*.typst" },
	once = true,
	callback = function()
		vim.pack.add({
			{
				src = "https://github.com/chomosuke/typst-preview.nvim",
				name = "typst_preview",
				version = vim.version.range("1.*"),
			},
		})

		require("typst_preview").setup({
			dependencies_bin = {
				tinymist = "tinymist",
			},
			open_cmd = "start %s",
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
