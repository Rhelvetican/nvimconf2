return {
	filetypes = { "zig", "zir", "zon" },
	root_markers = { "zls.json", "build.zig", "build.zig.zon", ".git" },
	settings = {
		zls = {
			enable_build_on_save = true,
			warn_style = true,
			semantic_tokens = "full",
		},
	},
}
