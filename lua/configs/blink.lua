---@module "blink.cmp"
---@type blink.cmp.Config
return {
	keymap = {
		preset = "super-tab",
		cmdline = { preset = "super-tab" },
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

		list = { selection = { preselect = true, auto_insert = false } },

		menu = { draw = { columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } } } },

		trigger = {
			show_on_trigger_character = true,
			show_on_insert_on_trigger_character = true,
		},
	},

	signature = { enabled = true, window = { treesitter_highlighting = true } },

	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},
}
