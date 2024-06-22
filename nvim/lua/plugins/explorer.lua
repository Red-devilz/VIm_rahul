return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- optionally enable 24-bit colour
            vim.opt.termguicolors = true

            local swap_then_open_tab = function()
                local api = require("nvim-tree.api")
                local node = api.tree.get_node_under_cursor()
                api.node.open.tab(node)
                vim.cmd.tabprev()
                vim.cmd("wincmd l")
            end

            local function my_on_attach(bufnr)
                local api = require "nvim-tree.api"

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                api.config.mappings.default_on_attach(bufnr)

                vim.keymap.set('n', 's',
                               api.node.open.vertical,
                               opts('New split'))
                vim.keymap.set('n', 't',
                               swap_then_open_tab,
                               opts('New tab'))
                vim.keymap.set('n', '?',
                               api.tree.toggle_help,
                               opts('Help'))
            end

            require("nvim-tree").setup({
              on_attach = my_on_attach,
              sort = {
                sorter = "case_sensitive",
              },
              view = {
                width = 20,
              },
              renderer = {
                group_empty = true,
                full_name = false,
                root_folder_label = false
              },
              filters = {
                dotfiles = true,
              },
              log = {
                enable = false
              }
            })

            vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true})
        end
    },
}

