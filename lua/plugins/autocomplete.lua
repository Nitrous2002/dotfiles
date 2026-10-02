return {
    --------------------------------------------------------------------------
    -- Mason
    --------------------------------------------------------------------------
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
        opts = {
            ensure_installed = {
                "pyright",
                "rust_analyzer",
                "clangd",
                "gopls",
                "bashls",
                "lua_ls",
            },
        },
    },

    --------------------------------------------------------------------------
    -- LSP
    --------------------------------------------------------------------------
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "Saghen/blink.cmp",
        },

        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Global defaults applied to every server
            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            -- Per-server overrides
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- Enable the servers (mason-lspconfig installs the binaries;
            -- this turns the LSP clients on for the relevant filetypes)
            vim.lsp.enable({
                "pyright",
                "rust_analyzer",
                "clangd",
                "gopls",
                "bashls",
                "lua_ls",
            })

            -- Useful LSP keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "[d", function()
                        vim.diagnostic.jump({ count = -1, float = true })
                    end, opts)
                    vim.keymap.set("n", "]d", function()
                        vim.diagnostic.jump({ count = 1, float = true })
                    end, opts)
		    vim.keymap.set("n", "<leader>K", function()
		    	vim.diagnostic.open_float()
		    end, opts)
                end,
            })
        end,
    },

    --------------------------------------------------------------------------
    -- Completion
    --------------------------------------------------------------------------
    {
        "Saghen/blink.cmp",
        version = "*",

        opts = {
            keymap = {
                preset = "default",
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                documentation = {
                    auto_show = true,
                },

                ghost_text = {
                    enabled = true,
                },
            },

            signature = {
                enabled = true,
            },

            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },
            },
        },
    },

    --------------------------------------------------------------------------
    -- Snippets
    --------------------------------------------------------------------------
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
    },

    --------------------------------------------------------------------------
    -- Treesitter
    --------------------------------------------------------------------------
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        opts = {
            ensure_installed = {
                "python",
                "rust",
                "c",
                "cpp",
                "go",
                "bash",
                "lua",
                "vim",
                "vimdoc",
                "markdown",
                "markdown_inline",
            },

            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
            },
        },
    },

    --------------------------------------------------------------------------
    -- Auto pairs
    --------------------------------------------------------------------------
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    --------------------------------------------------------------------------
    -- Formatter
    --------------------------------------------------------------------------
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "ruff_format" },
                rust = { "rustfmt" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                go = { "gofmt" },
                lua = { "stylua" },
                sh = { "shfmt" },
                bash = { "shfmt" },
            },

            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },

        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true })
                end,
                desc = "Format file",
            },
        },
    },
}
