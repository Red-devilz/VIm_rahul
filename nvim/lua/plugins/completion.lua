
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}


return {
    {
        "github/copilot.vim",
        event = "InsertEnter",
        config = function()
            vim.keymap.set('i', '<C-S>', '<Plug>(copilot-suggest)')
            vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
        end
    },
    {
        "hrsh7th/nvim-cmp", 
        event={"InsertEnter", "InsertLeave"},
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "micangl/cmp-vimtex",
        },

        config = function()


            local cmp = require('cmp')
            cmp.setup({
                view = {            
                    entries = "custom" -- can be "custom", "wildmenu" or "native"
                },
                completion = {
                    autocomplete = false, -- disable auto-completion.
                    completeopt = 'menu,insert,noselect',
                    border = 'rounded',
                    winhighlight = "Normal:None,FloatBorder:None,Search:None"
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                    documentation = {
                        border = 'rounded',
                        winhighlight = "Normal:None,FloatBorder:None,Search:None"
                    },
                },
                mapping = {
                    ['<C-g>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    ['<C-n>'] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif has_words_before() then
                                cmp.complete()
                            else
                                fallback()
                            end
                        end, { "i", "s" }),
                    ['<C-p>'] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            end
                        end, { "i", "s" }),
                    ['<CR>'] = cmp.mapping.confirm({ select = true })
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'vimtex' },
                    { name = 'path' },
                    { name = 'buffer' },
                },
                formatting = {
                    format = function(entry, vim_item)
                        -- Kind icons
                        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                        -- Source
                        vim_item.menu = ({
                            buffer = "[Buffer]",
                            path = "[Vimtex]",
                            vimtex = vim_item.menu,
                            path = "[Path]",
                            nvim_lsp = "[LSP]",
                        })[entry.source.name]
                        return vim_item
                    end
                },
            })
        end
    },
    {
        -- LSP config
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup({
                ui = {
                    size = { width = 0.4, height = 0.7 },
                    border = "rounded",
                }
            })
            local mason_lspconfig = require("mason-lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local lspconfig = require("lspconfig")

            on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }
                vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
            end

            local handlers =  {
                ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'}),
                ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'rounded'}),
            }

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

            mason_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    handlers = handlers
                })
            end,
            })
            --- Diagnostics
            local signs = {
                { name = "DiagnosticSignError", text = "" },
                { name = "DiagnosticSignWarn", text = "" },
                { name = "DiagnosticSignHint", text = "" },
                { name = "DiagnosticSignInfo", text = "" },
            }

            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, {
                    texthl = sign.name, text = sign.text, numhl = ""
                })
            end

            local config = {
                virtual_text = false,
                signs = {
                    active = signs,
                },
                update_in_insert = false,
                signcolumn = number,
                underline = false,
                severity_sort = true,
                float = {
                    header="",
                    prefix="",
                    border = "single",
                    style = "minimal",
                    format = function(diagnostic)
                        return string.format(
                            "%s (%s) [%s]",
                            diagnostic.message,
                            diagnostic.source,
                            diagnostic.code or diagnostic.user_data.lsp.code
                        )
                    end,
                },
            }
            vim.diagnostic.config(config)

        end
    },
}
