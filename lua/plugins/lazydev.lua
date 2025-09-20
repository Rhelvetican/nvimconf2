---@type LazySpec
return {
	"folke/lazydev.nvim",
	ft = "lua",
	priority = 9999,

	config = function()
		require("lazydev").setup({
			library = {
				"lazy.nvim",
				{ path = vim.env.VIMRUNTIME, words = { "vim" } },
			},
		})
	end,
}
