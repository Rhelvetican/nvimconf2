local augends = require("dial.augend")

require("dial.config").augends:register_group({
	default = {
		augends.integer.alias.decimal,
		augends.constant.alias.bool,
		augends.semver.alias.semver,
	},
})

local dialmap = require("dial.map")

vim.keymap.set("n", "<C-a>", function()
	dialmap.manipulate("increment", "normal")
end)
vim.keymap.set("n", "<C-x>", function()
	dialmap.manipulate("decrement", "normal")
end)
vim.keymap.set("n", "g<C-a>", function()
	dialmap.manipulate("increment", "gnormal")
end)
vim.keymap.set("n", "g<C-x>", function()
	dialmap.manipulate("decrement", "gnormal")
end)
vim.keymap.set("v", "<C-a>", function()
	dialmap.manipulate("increment", "visual")
end)
vim.keymap.set("v", "<C-x>", function()
	dialmap.manipulate("decrement", "visual")
end)
vim.keymap.set("v", "g<C-a>", function()
	dialmap.manipulate("increment", "gvisual")
end)
vim.keymap.set("v", "g<C-x>", function()
	dialmap.manipulate("decrement", "gvisual")
end)
