return {
    {
        "nvim-neorg/neorg",
        ft = "neorg",
        dependencies = { "vhyrro/luarocks.nvim" },
        lazy=False,
        config = function()
          require("luarocks-nvim").setup({})
          require("neorg").setup {
            load = {
              ["core.defaults"] = {}, -- Loads default behaviour
              ["core.concealer"] = {
                  config = {
                    icons = {
                      todo = {
                        undone    = { icon = '' },  -- 
                        done      = { icon = '' },  -- x
                        urgent    = { icon = '✗' },  -- !
                        uncertain = { icon = '?' }, -- ?
                        pending   = { icon = '' },  -- -
                        on_hold   = { icon = '=' },  -- =
                        cancelled = { icon = '' },  -- _
                        }
                    }
                  }
              }, -- Adds pretty icons to your documents
              ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                  workspaces = {
                    research = "~/Documents/acads/2023/notes",
                    meeting = "~/Documents/acads/2023/notes/meetings",
                  },
                  default_workspace = "research",
                },
              },
              ["core.ui.calendar"] = {},
              ["core.keybinds"] = {
                config = {
                    hook = function(keybinds)
                        keybinds.remap_event(
                            "norg", "n", "<C-j>",
                            "core.integrations.treesitter.next.heading")
                        keybinds.remap_event(
                            "norg", "n", "<C-k>",
                            "core.integrations.treesitter.previous.heading")
                    end,
                }
              }
            }
          }
      end,
    },
    {
        "vimwiki/vimwiki",
        ft = "md",
        init = function()
            vim.g.vimwiki_folding = ""
            vim.g.vimwiki_listsyms = "✗○◐●✓"
            vim.g.vimwiki_folding= "expr"
            vim.g.vimwiki_list = {
                { path = "$HOME/Documents/docs/wikiNotes/",
                  syntax = "markdown",
                  ext = ".wiki",
                },
            }
        end,
    },
}

