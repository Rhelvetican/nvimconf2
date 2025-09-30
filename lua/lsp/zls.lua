return {
	cmd = { "zls" },
	filetypes = { "zig", "zon" },
	root_markers = { "build.zig.zon", ".git" },
	settings = {
		zls = {
			warn_style = true,
			semantic_tokens = "full",
		},
	},
}
