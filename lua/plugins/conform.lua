return {
	"stevearc/conform.nvim",
	event = "BufWritePre",

	opts = {
		formatters = {
			["clang-format"] = {
				inherit = true,
				prepend_args = { "-style={BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 256}" },
			},

			rustfmt = {
				inherit = true,
				prepend_args = {
					"--config",
					"edition=2024,max_width=256,fn_single_line=true,format_macro_matchers=true,format_strings=true,hex_literal_case=Upper,reorder_impl_items=true,struct_field_align_threshold=256",
				},
			},
		},

		formatters_by_ft = {
			lua = { "stylua" },

			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },

			typst = { "typstyle" },

			rust = { "rustfmt", lsp_format = "fallback" },
			toml = { "taplo", lsp_format = "fallback" },
			zig = { "zigfmt", lsp_format = "fallback" },

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
