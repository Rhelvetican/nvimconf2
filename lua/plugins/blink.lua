return {
	"saghen/blink.cmp",

	dependencies = {
		"saghen/blink.compat",
		{ "rafamadriz/friendly-snippets", event = "BufEnter" },
		{ "mikavilpas/blink-ripgrep.nvim", version = "*" },
	},

	version = "1.*",

	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "super-tab",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "cmdline", "ripgrep" },
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
					score_offset = -100,

					---@type blink-ripgrep.Options
					opts = {
						backend = {
							use = "gitgrep-or-ripgrep",
							ripgrep = {
								max_filesize = "16M",
							},
						},
					},
				},
			},

			transform_items = function(ctx, items)
				for _, item in ipairs(items) do
					if item.source_id == "ripgrep" then
						item.labelDetails = {
							description = "(rg)",
						}
					end
				end

				return items
			end,

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

					components = {
						label = {
							---@param ctx blink.cmp.DrawItemContext
							text = function(ctx)
								return string.gsub(ctx.label, "… ", "…") .. ctx.label_detail
							end,
						},
						kind_icon = {
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
						kind = {
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
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
