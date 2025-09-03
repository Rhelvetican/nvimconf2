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
require("mini.operators").setup({})
require("mini.pairs").setup({})
require("mini.sessions").setup({})
require("mini.surround").setup({})
require("mini.tabline").setup({})

require("keys.mini")

---@type string[]
local whitelistedFiles = {
	".gitignore",
	".env",
	".luarc.json",
}

require("mini.files").setup({
	content = {
		---@param name string
		---@return boolean
		filter = function(name)
			return (not name:startswith(".")) or table.contains(whitelistedFiles, name)
		end,
	},
})
