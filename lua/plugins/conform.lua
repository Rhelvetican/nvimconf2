return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters = {
			["clang-format"] = {
				inherit = true,
				prepend_args = { '-style="{BasedOnStyle: LLVM, IndentWidth: 4, ColumnWidth: 256}"' },
			},

			["rustfmt"] = {
				options = {
					default_edition = "2024",
				},
			},
		},

		formatters_by_ft = {
			lua = { "stylua" },

			python = { "ruff_fix", "ruff_format", "ruff_organize_import" },

			rust = { lsp_format = "prefer" },
			toml = { "taplo", lsp_format = "fallback" },
			zig = { "zigfmt" },

			typescript = { "deno_fmt", lsp_format = "fallback" },
			javascript = { "deno_fmt", lsp_format = "fallback" },

			c = { "clang-format", lsp_format = "fallback" },
			cpp = { "clang-format", lsp_format = "fallback" },
			h = { "clang-format", lsp_format = "fallback" },
			hpp = { "clang-format", lsp_format = "fallback" },

			json = { "clang-format" },
		},

		format_on_save = {
			timeout_ms = 2500,
			lsp_format = "fallback",
		},
	},
}
