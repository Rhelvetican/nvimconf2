---@class LazyGitConfiguration
---@field binary string
---@field args   string[]

---@class LazyGit
local M = {
    ---@type LazyGitConfiguration
    config = {
        binary = "lazygit",
        args = {},
    },

    ---@type string[]?
    cmd = { "lazygit" },
}

---@param opts? LazyGitConfiguration
function M.setup(opts)
    M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.command()
    ---@type string[]
    local cmd = M.cmd ?? { M.config.binary }

    for _, arg in ipairs(M.config.args) do
        cmd[#cmd + 1] = arg
    end

    M.cmd = cmd
    return cmd
end

function M.toggle()
    Snacks.terminal.toggle(M.command(), {
        win = {
            relative = "editor",
            position = "float",
            border   = "rounded",
        },
    })
end

return M
