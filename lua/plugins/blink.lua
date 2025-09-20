return {
	"saghen/blink.cmp",

	dependencies = {
		"saghen/blink.compat",
		{ "rafamadriz/friendly-snippets", event = "BufEnter" },
		{ "folke/lazydev.nvim", ft = "lua" },
		{ "Fildo7525/pretty_hover", event = "LspAttach", opts = { border = "rounded" } },
	},

	version = "1.*",
	opts = {
		keymap = {
			preset = "super-tab",
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

				draw = function(opts)
					if opts.item and opts.item.documentation and opts.item.documentation.value then
						local out = require("pretty_hover.parser").parse(opts.item.documentation.value)
						opts.item.documentation.value = out:string()
					end

					opts.default_implementation(opts)
				end,
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
						{ "kind_icon" },
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

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer", "cmdline" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
	},

	opts_extend = { "sources.default" },
}
