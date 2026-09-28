local utils = require("utils")

utils.createUserCmd("PackUpdate", function(args) vim.pack.update(args.fargs) end)
utils.createUserCmd("Notifications", MiniNotify.show_history)
utils.createUserCmd("OpenConfig", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end)
utils.createUserCmd("LspInfo", function() vim.cmd("checkhealth vim.lsp") end)
