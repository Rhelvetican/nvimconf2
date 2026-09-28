---@meta

---@class Utils
local M = {}

---@generic K, V
---@param mode "force" | "keep" | "error" | fun(key: K, current_value: V, previous_value: V): V
---@param ...  table<K, V>
function M.mergeTable(mode, ...) end

--- Creates a global `user-commands` command.
---@param cmd     string
---@param command string | fun(args: vim.api.keyset.create_user_command.command_args)
---@param opts    vim.api.keyset.user_command?
function M.createUserCmd(cmd, command, opts) end

---@param keybind string | string[]
---@param command string | fun()
---@param opts?   vim.keymap.set.Opts
function M.mapGeneral(keybind, command, opts) end

---@param opts?      snacks.input.Opts
---@param on_confirm fun(input: string?)
function M.propmptInput(opts, on_confirm) end

return M
