return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = { theme = "auto" },
				sections = {
					lualine_a = { { "mode", color = { gui = "bold" } } },
					lualine_b = {
						{ "branch", color = { gui = "bold" } },
						{ "diff", color = { gui = "bold" } },
						{ "diagnostics", color = { gui = "bold" } },
					},
					lualine_c = { { "filename", color = { gui = "bold" } } },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { { "location", color = { gui = "bold" } } },
				},
				extensions = { "toggleterm" },
			})
		end,
	},
}
