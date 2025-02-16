---@module "conform"

local config = {
	---@type table<string, conform.FormatterConfigOverride>
	formatters = {
		["clang-format"] = {
			inherit = true,
			prepend_args = { "-assume-filename", '--style="{BasedOnStyle: llvm, IndentWidth: 4}"' },
		},
	},

	---@type table<string, conform.FiletypeFormatter>
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_import" },
		rust = { "rustfmt", lsp_format = "fallback" },
		toml = { "taplo", lsp_format = "fallback" },
		zig = { "zigfmt" },
		typescript = { "deno_fmt", lsp_format = "fallback" },
		javascript = { "deno_fmt", lsp_format = "fallback" },
		c = { "clang-format", lsp_format = "fallback" },
		cpp = { "clang-format", lsp_format = "fallback" },
		h = { "clang-format", lsp_format = "fallback" },
		hpp = { "clang-format", lsp_format = "fallback" },
	},

	format_on_save = {
		timeout_ms = 2500,
		lsp_format = "fallback",
	},
}

return config
