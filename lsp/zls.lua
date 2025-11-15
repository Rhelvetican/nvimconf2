return {
	filetypes = { "zig", "zir", "zon" },
	root_markers = { "zls.json", "build.zig", "build.zig.zon", ".git" },
	settings = {
		zls = {
			warn_style = true,
			semantic_tokens = "full",
		},
	},
}
