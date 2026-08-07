return {
	cmd = { "taplo", "lsp", "--config", vim.env["TAPLO_CONFIG"] or "~/.config/taplo.toml", "stdio" },
}
