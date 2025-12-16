vim.g.rustaceanvim = function()
	return {
		server = {
			on_attach = function(_, _)
				local map = vim.keymap.set

				local function map_rustlsp(keymap, command)
					map({ "n", "v", "o" }, keymap, "<cmd>RustLsp " .. command .. "<CR>")
				end

				local function map_rustlsp_b(keymap, command)
					map({ "n", "v", "o" }, keymap, "<cmd>RustLsp! " .. command .. "<CR>")
				end

				map_rustlsp("<leader>ee", "explainError")
				map_rustlsp("<leader>em", "expandMacro")
				map_rustlsp("<leader>oc", "openCargo")
				map_rustlsp("<leader>od", "openDocs")
				map_rustlsp("<leader>pm", "parentModule")
				map_rustlsp("<leader>bm", "rebuildProcMacros")
				map_rustlsp("<leader>m<Up>", "moveItem up")
				map_rustlsp("<leader>m<Down>", "moveItem down")
				map_rustlsp("<leader>st", "syntaxTree")

				map_rustlsp("<leader>db", "debuggables")
				map_rustlsp_b("<leader>db!", "debuggables")
				map_rustlsp("<leader>rr", "runnables")
				map_rustlsp_b("<leader>rr!", "debuggables")
			end,
		},
	}
end
