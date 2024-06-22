return {
    {
	   "rebelot/kanagawa.nvim",
	    lazy = false,
	    priority=1000,
	    config = function()
            require('kanagawa').setup({
                compile = false,
                commentStyle = { italic = true },
                transparent = true,
                terminalColors = true,
                colors = {
                theme = { wave = { ui = {
                    bg_gutter = "none",
                    bg_visual = '#ffffff'
                }}}
                },
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        FloatTitle = { bg = "none" },
                        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                        LazyNormal = { bg = "none", fg = "none" },
                        MasonNormal = { bg = "none", fg = "none" },
                    }
                end,
            })
            vim.cmd("colorscheme kanagawa")
	    end,
    },
    {
        'nanozuki/tabby.nvim',
        event = 'VimEnter', -- if you want lazy load, see below
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            local theme = {
              fill = 'TabLineFill',
              head = 'TabLine',
              current_tab = 'TabLineSel',
              tab = 'TabLine',
              win = 'TabLine',
              tail = 'TabLine',
            }
            require('tabby').setup({})
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('lualine').setup({})
        end,
    }
}

