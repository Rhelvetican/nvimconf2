local map_nv = function(keymap, cmd)
	vim.keymap.set({ "n", "v" }, keymap, cmd)
end

map_nv("<leader>ca", "<cmd>Lspsaga code_action<CR>")
map_nv("<leader>cf", "<cmd>Lspsaga finder<CR>")
map_nv("<leader>cg", "<cmd>Lspsaga goto_definition<CR>")
map_nv("<leader>cp", "<cmd>Lspsaga peek_definition<CR>")
map_nv("<leader>ctg", "<cmd>Lspsaga goto_type_definition<CR>")
map_nv("<leader>ctp", "<cmd>Lspsaga peek_type_definition<CR>")
map_nv("<leader>cdw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
map_nv("<leader>cdl", "<cmd>Lspsaga show_line_diagnostics<CR>")
map_nv("<leader>cdb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
map_nv("<leader>cdc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
map_nv("<leader>cdn", "<cmd>Lspsaga diagnostic_jump_next<CR>")
map_nv("<leader>cdN", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map_nv("<leader>k", "<cmd>Lspsaga hover_doc<CR>")

return {
	ui = {
		button = { "", "" },
	},
}
