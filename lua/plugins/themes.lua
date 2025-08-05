---@module "lazy"
---@type LazySpec
return {
	{
		"rktjmp/lush.nvim",
	},

	{
		"arturgoms/moonbow.nvim",
		priority = 1000,

		config = function()
			require("moonbow").setup({
				---@type table<string,vim.api.keyset.highlight>
				overrides = {
					Delimiter = { link = "MoonbowFg4" },
					["@punctuation.special"] = { link = "@punctuation.bracket" },
					SpecialKey = { link = "@punctuation.bracket" },
				},
			})
		end,
	},

	{
		"Mofiqul/vscode.nvim",
		priority = 1000,

		config = function()
			require("vscode").setup({
				italic_comments = true,
				terminal_colors = true,
			})
		end,
	},

	{
		"ptdewey/monalisa-nvim",
		priority = 1000,
	},
}
