-- Configure these yourself, bruv.

local args = { "--", "-W", "clippy::pedantic" }
local allows = {
    "ignore_without_reason",
    "maybe_infinite_iter",
    "must_use_candidate",
    "too_many_lines",
    "verbose_bit_mask"
}

for _, lint in pairs(allows) do
    args[#args + 1] = "-A"
    args[#args + 1] = string.format("clippy::%s", lint)
end

vim.g.rustaceanvim = {
    server = {
        default_settings = {
            ["rust-analyzer"] = {
                check = {
                    command = "clippy",
                    extraArgs = args
                }
            }
        }
    }
}
