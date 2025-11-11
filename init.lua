require("options")
require("lazypkg")
require("mappings")

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd([[colorscheme lemons]])
