local lazydev = {
	"folke/lazydev.nvim",
	ft = "lua",
	priority = 9999,

	dependencies = {
		{
			"DrKJeff16/wezterm-types",
			lazy = true,
			version = false,
		},
	},

	config = function()
		require("lazydev").setup({
			library = {
				"lazy.nvim",
				{ path = vim.env.VIMRUNTIME, words = { "vim" } },
				{ path = "wezterm-types", mods = { "wezterm" } },
			},
		})
	end,
}

return {
	"saghen/blink.cmp",

	dependencies = {
		"saghen/blink.compat",
		{ "rafamadriz/friendly-snippets", event = "BufEnter" },
		{ "mikavilpas/blink-ripgrep.nvim", version = "*" },
		lazydev,
	},

	version = "1.*",

	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "super-tab",
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer", "cmdline", "ripgrep" },
			min_keyword_length = 1,

			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},

				ripgrep = {
					name = "Ripgrep",
					module = "blink-ripgrep",
					opts = {},
				},
			},

			per_filetype = {},
		},

		cmdline = {
			keymap = { preset = "super-tab" },
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 50,
				treesitter_highlighting = true,
			},

			keyword = { range = "full" },

			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},

			menu = {
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind" },
					},
				},
			},

			trigger = {
				show_on_trigger_character = true,
				show_on_insert_on_trigger_character = true,
			},
		},

		signature = {
			enabled = true,
			window = { treesitter_highlighting = true },
		},
	},

	opts_extend = { "sources.default" },
}
