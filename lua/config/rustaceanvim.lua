vim.g.rustaceanvim = {
    server = {
        default_settings = {
            ["rust-analyzer"] = {
                check = {
                    command = "clippy",
                    extraArgs = { "--", "-W", "clippy::pedantic" }
                }
            }
        }
    }
}
