local o = vim.o
local g = vim.g
local wo = vim.wo

vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	signs = true,
	underline = true,
	severity_sort = true,
})

o.background = "dark"

o.laststatus = 3 -- global statusline
o.showmode = false

o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
o.clipboard = "unnamedplus"

-- Indenting
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

vim.opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"
o.mousemoveevent = true

o.number = true

o.signcolumn = "no"
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 400
o.undofile = true
o.cursorline = true

wo.relativenumber = true

g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

g.markdown_fenced_languages = {
	"rs=rust",
	"js=javascript",
	"ts=typescript",
}
