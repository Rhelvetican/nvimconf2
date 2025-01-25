require("oil").setup({
	default_file_explorer = true,

	columns = {
		"icon",
		"size",
	},

	win_options = {
		wrap = true,
	},

	view_options = {
		show_hidden = true,
		is_hidden_file = function(name, _)
			return name == ".gitignore" or name:sub(1, #".") == "."
		end,
	},
})
