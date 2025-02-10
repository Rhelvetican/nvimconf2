---@module "conform"
return {
	---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
	formatters = {
		["clang_format"] = {
			inherit = true,
			command = "clang-format",
			args = { "-assume-filename", "$FILENAME", '--style="{BasedOnStyle: llvm, IndentWidth: 4}"' },
		},
		["clang-format"] = {
			inherit = true,
			command = "clang-format",
			args = { "-assume-filename", "$FILENAME", '--style="{BasedOnStyle: llvm, IndentWidth: 4}"' },
		},
	},

	---@type table<string, conform.FiletypeFormatter>
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_import" },
		rust = { "rustfmt", lsp_format = "fallback" },
		toml = { "taplo fmt", lsp_format = "fallback" },
		zig = { "zigfmt" },
		typescript = { "deno_fmt", lsp_format = "fallback" },
		javascript = { "deno_fmt", lsp_format = "fallback" },
		c = { "clang_format", lsp_format = "fallback" },
		cpp = { "clang_format", lsp_format = "fallback" },
		h = { "clang_format", lsp_format = "fallback" },
		hpp = { "clang_format", lsp_format = "fallback" },
	},

	format_on_save = {
		timeout_ms = 2500,
		lsp_format = "fallback",
	},
}
