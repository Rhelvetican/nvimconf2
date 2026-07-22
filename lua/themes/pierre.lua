local colors = {
	-- Base
	bg = "#0a0a0a",
	fg = "#fafafa",
	cursor = "#4ea4ff",
	selection = "#193d5b",
	comment = "#737373",
	line_nr = "#444444",
	cursor_line = "#171717",

	-- ANSI (terminal)
	black = "#171717",
	red = "#ff4059",
	green = "#4cc652",
	yellow = "#ffd44c",
	blue = "#4ea4ff",
	magenta = "#e23cb4",
	cyan = "#53cafe",
	white = "#bcbcbc",

	bright_black = "#171717",
	bright_red = "#ff4059",
	bright_green = "#9cd343",
	bright_yellow = "#ffd44c",
	bright_blue = "#4ea4ff",
	bright_magenta = "#e23cb4",
	bright_cyan = "#53cafe",
	bright_white = "#bcbcbc",

	-- Semantic / custom
	keyword = "#ff4059", -- red
	function_ = "#4ea4ff", -- blue
	string_ = "#4cc652", -- green
	number_ = "#ffd44c", -- yellow
	type_ = "#53cafe", -- cyan
	constant_ = "#e23cb4", -- magenta
	operator_ = "#ff4059", -- same as keyword
	preproc = "#e23cb4", -- magenta
	special = "#53cafe", -- cyan
	error_ = "#ff4059",
	warning_ = "#ffd44c",
	info_ = "#4ea4ff",
	hint_ = "#4cc652",
}

-- Set terminal colors (for :terminal)
vim.g.terminal_color_0 = colors.black
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.magenta
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.bright_black
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white

-- Helper to set highlight groups
local function set_hl(group, opts)
	opts = opts or {}
	vim.api.nvim_set_hl(0, group, opts)
end

-- Reset all highlights (optional, but good practice)
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "pierre-dark-vibrant"

-- Base groups
set_hl("Normal", { fg = colors.fg, bg = colors.bg })
set_hl("NormalNC", { fg = colors.fg, bg = colors.bg })
set_hl("NormalFloat", { fg = colors.fg, bg = colors.bg })
set_hl("FloatBorder", { fg = colors.line_nr, bg = colors.bg })
set_hl("NonText", { fg = colors.line_nr })
set_hl("SpecialKey", { fg = colors.line_nr })
set_hl("Cursor", { fg = colors.bg, bg = colors.cursor })
set_hl("CursorLine", { bg = colors.cursor_line })
set_hl("CursorLineNr", { fg = colors.cursor, bg = colors.cursor_line, bold = true })
set_hl("CursorColumn", { bg = colors.cursor_line })
set_hl("LineNr", { fg = colors.line_nr, bg = colors.bg })
set_hl("SignColumn", { fg = colors.line_nr, bg = colors.bg })
set_hl("FoldColumn", { fg = colors.line_nr, bg = colors.bg })
set_hl("FoldMarker", { fg = colors.line_nr, bg = colors.bg })
set_hl("EndOfBuffer", { fg = colors.bg })
set_hl("Search", { fg = colors.bg, bg = colors.yellow })
set_hl("IncSearch", { fg = colors.bg, bg = colors.yellow })
set_hl("MatchParen", { fg = colors.bg, bg = colors.blue })
set_hl("Visual", { bg = colors.selection })
set_hl("VisualNOS", { bg = colors.selection })
set_hl("ColorColumn", { bg = colors.cursor_line })

-- Syntax groups
set_hl("Comment", { fg = colors.comment, italic = true })
set_hl("Constant", { fg = colors.constant_ })
set_hl("String", { fg = colors.string_ })
set_hl("Character", { fg = colors.string_ })
set_hl("Number", { fg = colors.number_ })
set_hl("Boolean", { fg = colors.number_ })
set_hl("Float", { fg = colors.number_ })
set_hl("Identifier", { fg = colors.function_ })
set_hl("Function", { fg = colors.function_ })
set_hl("Statement", { fg = colors.keyword })
set_hl("Conditional", { fg = colors.keyword })
set_hl("Repeat", { fg = colors.keyword })
set_hl("Label", { fg = colors.keyword })
set_hl("Operator", { fg = colors.operator_ })
set_hl("Keyword", { fg = colors.keyword })
set_hl("Exception", { fg = colors.keyword })
set_hl("PreProc", { fg = colors.preproc })
set_hl("Include", { fg = colors.preproc })
set_hl("Define", { fg = colors.preproc })
set_hl("Macro", { fg = colors.preproc })
set_hl("PreCondit", { fg = colors.preproc })
set_hl("Type", { fg = colors.type_ })
set_hl("StorageClass", { fg = colors.type_ })
set_hl("Structure", { fg = colors.type_ })
set_hl("Typedef", { fg = colors.type_ })
set_hl("Special", { fg = colors.special })
set_hl("SpecialChar", { fg = colors.special })
set_hl("Tag", { fg = colors.special })
set_hl("Delimiter", { fg = colors.fg })
set_hl("SpecialComment", { fg = colors.comment, italic = true })
set_hl("Debug", { fg = colors.keyword })
set_hl("Underlined", { fg = colors.blue, underline = true })
set_hl("Ignore", { fg = colors.bg })
set_hl("Error", { fg = colors.error_, bg = colors.bg })
set_hl("Todo", { fg = colors.yellow, bg = colors.bg, bold = true })

-- Tree-sitter (if installed)
set_hl("@comment", { fg = colors.comment, italic = true })
set_hl("@error", { fg = colors.error_ })
set_hl("@none", {})
set_hl("@preproc", { fg = colors.preproc })
set_hl("@define", { fg = colors.preproc })
set_hl("@operator", { fg = colors.operator_ })
set_hl("@punctuation.delimiter", { fg = colors.fg })
set_hl("@punctuation.bracket", { fg = colors.fg })
set_hl("@punctuation.special", { fg = colors.special })
set_hl("@string", { fg = colors.string_ })
set_hl("@string.regex", { fg = colors.string_ })
set_hl("@string.escape", { fg = colors.special })
set_hl("@string.special", { fg = colors.special })
set_hl("@character", { fg = colors.string_ })
set_hl("@character.special", { fg = colors.special })
set_hl("@boolean", { fg = colors.number_ })
set_hl("@number", { fg = colors.number_ })
set_hl("@float", { fg = colors.number_ })
set_hl("@function", { fg = colors.function_ })
set_hl("@function.builtin", { fg = colors.function_ })
set_hl("@function.call", { fg = colors.function_ })
set_hl("@function.macro", { fg = colors.function_ })
set_hl("@method", { fg = colors.function_ })
set_hl("@method.call", { fg = colors.function_ })
set_hl("@constructor", { fg = colors.type_ })
set_hl("@parameter", { fg = colors.fg })
set_hl("@keyword", { fg = colors.keyword })
set_hl("@keyword.return", { fg = colors.keyword })
set_hl("@keyword.function", { fg = colors.keyword })
set_hl("@conditional", { fg = colors.keyword })
set_hl("@repeat", { fg = colors.keyword })
set_hl("@debug", { fg = colors.keyword })
set_hl("@label", { fg = colors.keyword })
set_hl("@include", { fg = colors.preproc })
set_hl("@exception", { fg = colors.keyword })
set_hl("@type", { fg = colors.type_ })
set_hl("@type.builtin", { fg = colors.type_ })
set_hl("@type.definition", { fg = colors.type_ })
set_hl("@storageclass", { fg = colors.type_ })
set_hl("@attribute", { fg = colors.preproc })
set_hl("@field", { fg = colors.function_ })
set_hl("@property", { fg = colors.function_ })
set_hl("@variable", { fg = colors.fg })
set_hl("@variable.builtin", { fg = colors.fg })
set_hl("@namespace", { fg = colors.type_ })
set_hl("@text", { fg = colors.fg })
set_hl("@text.strong", { bold = true })
set_hl("@text.emphasis", { italic = true })
set_hl("@text.underline", { underline = true })
set_hl("@text.strike", { strikethrough = true })
set_hl("@text.title", { fg = colors.function_ })
set_hl("@text.literal", { fg = colors.string_ })
set_hl("@text.reference", { fg = colors.comment })
set_hl("@text.todo", { fg = colors.yellow, bold = true })
set_hl("@text.note", { fg = colors.blue })
set_hl("@text.warning", { fg = colors.yellow })
set_hl("@text.danger", { fg = colors.red })

-- LSP / Diagnostics (vim.diagnostic)
set_hl("DiagnosticError", { fg = colors.error_ })
set_hl("DiagnosticWarn", { fg = colors.warning_ })
set_hl("DiagnosticInfo", { fg = colors.info_ })
set_hl("DiagnosticHint", { fg = colors.hint_ })
set_hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.error_ })
set_hl("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warning_ })
set_hl("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.info_ })
set_hl("DiagnosticUnderlineHint", { undercurl = true, sp = colors.hint_ })
set_hl("DiagnosticVirtualTextError", { fg = colors.error_ })
set_hl("DiagnosticVirtualTextWarn", { fg = colors.warning_ })
set_hl("DiagnosticVirtualTextInfo", { fg = colors.info_ })
set_hl("DiagnosticVirtualTextHint", { fg = colors.hint_ })
set_hl("DiagnosticFloatingError", { fg = colors.error_ })
set_hl("DiagnosticFloatingWarn", { fg = colors.warning_ })
set_hl("DiagnosticFloatingInfo", { fg = colors.info_ })
set_hl("DiagnosticFloatingHint", { fg = colors.hint_ })
set_hl("DiagnosticSignError", { fg = colors.error_ })
set_hl("DiagnosticSignWarn", { fg = colors.warning_ })
set_hl("DiagnosticSignInfo", { fg = colors.info_ })
set_hl("DiagnosticSignHint", { fg = colors.hint_ })

-- LSP references / highlights
set_hl("LspReferenceText", { bg = colors.selection })
set_hl("LspReferenceRead", { bg = colors.selection })
set_hl("LspReferenceWrite", { bg = colors.selection })
set_hl("LspCodeLens", { fg = colors.comment })
set_hl("LspSignatureActiveParameter", { fg = colors.bg, bg = colors.blue })

-- Telescope, NvimTree, etc. (common plugin highlights)
set_hl("TelescopeNormal", { fg = colors.fg, bg = colors.bg })
set_hl("TelescopeBorder", { fg = colors.line_nr, bg = colors.bg })
set_hl("TelescopePromptNormal", { fg = colors.fg, bg = colors.cursor_line })
set_hl("TelescopePromptBorder", { fg = colors.line_nr, bg = colors.cursor_line })
set_hl("TelescopeResultsNormal", { fg = colors.fg, bg = colors.bg })
set_hl("TelescopeResultsBorder", { fg = colors.line_nr, bg = colors.bg })
set_hl("TelescopePreviewNormal", { fg = colors.fg, bg = colors.bg })
set_hl("TelescopePreviewBorder", { fg = colors.line_nr, bg = colors.bg })
set_hl("NvimTreeNormal", { fg = colors.fg, bg = colors.bg })
set_hl("NvimTreeCursorLine", { bg = colors.cursor_line })
set_hl("NvimTreeFolderName", { fg = colors.function_ })
set_hl("NvimTreeFolderIcon", { fg = colors.function_ })
set_hl("NvimTreeFileIcon", { fg = colors.fg })
set_hl("NvimTreeExecFile", { fg = colors.string_ })
set_hl("NvimTreeOpenedFolderName", { fg = colors.function_ })
set_hl("NvimTreeIndentMarker", { fg = colors.line_nr })

-- Return the colors for potential use
return colors
