---@module "lazygit"
local M = {}

---@class LazyGitConfiguration
---@field binary string
---@field args? string[]

---@type LazyGitConfiguration
M.config = {
	binary = "lazygit",
}

---@type string[]?
M.cmd = nil

---@param opts? LazyGitConfiguration
function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.command()
	local cmd = M.cmd or { M.config.binary }

	if M.cmd then
		return M.cmd
	end

	if M.config.args then
		for _, arg in ipairs(M.config.args) do
			cmd[#cmd + 1] = arg
		end
	end

	M.cmd = cmd
	return cmd
end

function M.toggle()
	Snacks.terminal.toggle(
		M.command(),
		{ win = {
			relative = "editor",
			position = "float",
			border = "rounded",
		} }
	)
end

return M
