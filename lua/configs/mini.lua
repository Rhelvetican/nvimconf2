require("mini.align").setup({})
require("mini.basics").setup({})
require("mini.comment").setup({})
require("mini.diff").setup({})

require("mini.fuzzy").setup({})
require("mini.icons").setup({})
require("mini.misc").setup({})
require("mini.operators").setup({})
require("mini.sessions").setup({})
require("mini.surround").setup({})
require("mini.statusline").setup({})

require("keys.mini")

require("mini.colors").setup({})

require("mini.files").setup({
	mappings = {
		go_in = "]",
		go_in_plus = "<C-]>",
		go_out = "[",
		go_out_plus = "<C-[>",
	},
})

local notify = require("mini.notify")
notify.setup({})

vim.notify = notify.make_notify({
	ERROR = { duration = 6000 },
	WARN = { duration = 4000 },
	INFO = { duration = 2000 },
})

require("mini.pairs").setup({
	mappings = {
		["'"] = false,

		["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },
		[">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
	},
})
