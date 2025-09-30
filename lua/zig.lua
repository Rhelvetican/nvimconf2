vim.lsp.config("zls", require("lsp.zls"))
vim.lsp.enable("zls")

---@param actions? string[]
local function zig_autorun(actions)
	for _, action in ipairs(actions or {}) do
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.zig", "*.zon" },
			callback = function(_)
				vim.lsp.buf.code_action({
					context = { only = { action } },
					apply = true,
				})
			end,
		})
	end
end

zig_autorun({ "source.organizeImports" })
