---@diagnostic disable: assign-type-mismatch

local o     = vim.o
local g     = vim.g
local wo    = vim.wo
local utils = require("lua.util")

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    signs = true,
    underline = true,
    severity_sort = true,
})

vim.cfpath = vim.fn.stdpath("config")

wo.relativenumber           = true
g.mapleader                 = ","
g.markdown_fenced_languages = { "rs=rust", "js=javascript", "ts=typescript" }
o                           = utils.mergeTable("force", o, {
    background     = "dark",
    laststatus     = 3,
    showmode       = false,
    sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
    clipboard      = "unnamedplus",
    shell          = "nu",
    shellcmdflag   = "-c",
    shellquote     = "",
    shellxquote    = "",
    ignorecase     = true,
    smartcase      = true,
    mouse          = "a",
    mousemoveevent = true,
    number         = true,
    signcolumn     = "no",
    splitbelow     = true,
    splitright     = true,
    termguicolors  = true,
    timeoutlen     = 400,
    undofile       = true,
    cursorline     = true,
    expandtab      = true,
    shiftwidth     = 4,
    smartindent    = true,
    tabstop        = 4,
    softtabstop    = 4,
    winborder      = "rounded",
})

vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.api.nvim_create_autocmd({ "LspAttach", "BufEnter", "TextChanged" }, {
    callback = function()
        vim.lsp.inlay_hint.enable()
    end,
})
