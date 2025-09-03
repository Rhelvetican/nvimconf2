require("mini.align").setup({})
require("mini.basics").setup({})
require("mini.bracketed").setup({})
require("mini.comment").setup({})
require("mini.diff").setup({})
require("mini.doc").setup({})
require("mini.extra").setup({})
require("mini.fuzzy").setup({})
require("mini.git").setup({})
require("mini.icons").setup({})
require("mini.misc").setup({})
require("mini.move").setup({})
require("mini.operators").setup({})
require("mini.pairs").setup({})
require("mini.sessions").setup({})
require("mini.surround").setup({})
require("mini.tabline").setup({})

require("keys.mini")

require("mini.files").setup({
	content = {
		filter = function(name)
			return true
		end,
	},
})
