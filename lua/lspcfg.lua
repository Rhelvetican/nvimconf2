---@type string[]
local lsps = {
    "clangd",
    "denols",
    -- "harper_ls",
    "jdtls",
    "jsonls",
    "nushell",
    "emmylua_ls",
    "ruff",
    "tombi",
    "tinymist",
    "ty",
    "zls"
}

local config, enable = vim.lsp.config, vim.lsp.enable

for _, server in ipairs(lsps) do
    ---@param file string
    ---@return any
    local function loadFile(file)
        ---@diagnostic disable-next-line: need-check-nil
        return load(io.open(file, "r"):read("*a") or "return function() end")()
    end

    local ok, res = pcall(loadFile, string.format("%s/lsp/%s.lua", vim.cfpath, server))

    if ok then
        local server_config = vim.tbl_deep_extend("force", config[server] or {}, res)
        config(server, server_config)
    end

    enable(server)
end
