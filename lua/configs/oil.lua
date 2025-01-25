require("oil").setup({
	default_file_explorer = true,

	columns = {
		"icon",
		"permissions",
		"size",
	},

	win_options = {
		wrap = true,
	},

	view_options = {
		show_hidden = true,
		is_hidden_file = function(name, _)
			return name == ".gitignore" and name:sub(1, #".") ~= "."
		end,
	},
})
