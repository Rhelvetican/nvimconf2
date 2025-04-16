---@module "mini"

require("mini.ai").setup({})
require("mini.align").setup({})
require("mini.basics").setup({})
require("mini.bracketed").setup({})
require("mini.bufremove").setup({})
require("mini.clue").setup({})
require("mini.comment").setup({})
require("mini.cursorword").setup({})
require("mini.diff").setup({})
require("mini.doc").setup({})
require("mini.extra").setup({})
require("mini.fuzzy").setup({})
require("mini.git").setup({})
require("mini.hipatterns").setup({})
require("mini.icons").setup({})
require("mini.map").setup({})
require("mini.misc").setup({})
require("mini.move").setup({})
require("mini.operators").setup({})
require("mini.pairs").setup({})
require("mini.sessions").setup({})
require("mini.splitjoin").setup({})
require("mini.tabline").setup({})
require("mini.test").setup({})
require("mini.visits").setup({})

require("mini.surround").setup({
	mappings = {
		add = "ta",
		delete = "td",
		find = "tf",
		find_left = "tF",
		highlight = "th",
		replace = "tr",
		update_n_lines = "tn",

		suffix_last = "l",
		suffix_next = "n",
	},
})
