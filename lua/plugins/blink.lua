local lazydev_loaded = false

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    callback = function()
        vim.pack.add({
            "https://github.com/rafamadriz/friendly-snippets",
            { src = "https://github.com/mikavilpas/blink-ripgrep.nvim", version = vim.version.range("*") },
        })
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.lua" },
    callback = function()
        vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
        require("lazydev").setup({
            library = {
                "vim.pack",
                "blink.cmp",
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        })
        lazydev_loaded = true
    end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
    callback = function()
        vim.pack.add({ { src = "https://www.github.com/saghen/blink.cmp", version = vim.version.range("1.*") } })

        local sources = { "lsp", "path", "snippets", "buffer", "cmdline", "ripgrep" }
        local providers = {
            ripgrep = {
                name = "Ripgrep",
                module = "blink-ripgrep",
                score_offset = -100,

                opts = {
                    backend = {
                        use = "gitgrep-or-ripgrep",
                        ripgrep = {
                            max_filesize = "16M",
                        },
                    },
                },
            },
        }

        if lazydev_loaded then
            sources[#sources + 1] = "lazydev"
            providers["lazydev"] = {
                name = "lazydev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
            }
        end

        require("blink.cmp").setup({
            fuzzy = { implementation = "prefer_rust_with_warning" },

            keymap = { preset = "super-tab" },

            sources = {
                default = sources,
                min_keyword_length = 1,

                providers = providers,

                transform_items = function(_, items)
                    for _, item in ipairs(items) do
                        if item.source_id == "ripgrep" then
                            item.labelDetails = {
                                description = "(rg)",
                            }
                        end
                    end

                    return items
                end,

                per_filetype = {},
            },

            cmdline = {
                keymap = { preset = "super-tab" },
                completion = {
                    menu = {
                        auto_show = true,
                    },
                },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 50,
                    treesitter_highlighting = true,
                },

                keyword = { range = "full" },

                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },

                menu = {
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind" },
                        },

                        components = {
                            label = {
                                text = function(ctx)
                                    return string.gsub(ctx.label, "… ", "…") .. ctx.label_detail
                                end,
                            },
                            kind_icon = {
                                text = function(ctx)
                                    local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return kind_icon
                                end,
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                            },
                            kind = {
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                            },
                        },
                    },
                },

                trigger = {
                    show_on_trigger_character = true,
                    show_on_insert_on_trigger_character = true,
                },
            },

            signature = {
                enabled = true,
                window = { treesitter_highlighting = true },
            },
        })
    end,
})
