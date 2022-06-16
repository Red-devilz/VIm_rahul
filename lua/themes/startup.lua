local present, alpha = pcall(require, "alpha")
if not present then
   return
end

local header = {
    type = "text",
    val = {
[[]],
[[]],
[[     _   __                _          ]],
[[    / | / /__  ____ _   __(_)___ ___  ]],
[[   /  |/ / _ \/ __ \ | / / / __ `__ \ ]],
[[  / /|  /  __/ /_/ / |/ / / / / / / / ]],
[[ /_/ |_/\___/\____/|___/_/_/ /_/ /_/  ]],
[[]],
    },
    opts = {
        position = "left",
        hl = "String"
    }
}



local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "left",
        shortcut = sc,
        cursor = 5,
        width = 24,
        align_shortcut = "right",
        hl_shortcut = "Function",
        hl = "Function",
    }
    if keybind then
        opts.keymap = {"n", sc_, keybind, {noremap = true, silent = true}}
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
    }
end
local buttons = {
    type = "group",
    val = {
    button( "e",    "   Edit" , ":ene <BAR> startinsert <CR>"),

    button( "r",    "   Recent" , ":Telescope oldfiles<CR>"),
    button( "b",    "   Browser" , ":Telescope file_browser<CR>"),
    button( "w", " 🗈  Wiki" , ":VimwikiIndex<CR>:Goyo<CR>"),
    button( '',     " 漣 Config"),
    button( 'v',  "     Vim", ':cd ~/.config/nvim/ | :e ~/.config/nvim/init.vim<CR>'),
    button( 'z',  "     Zsh", ':e ~/.zshrc <CR>'),
    button( '', "  Org"),
    button( 'o',  "     Agenda", ':lua agenda_from_terminal()<CR>'),
    button( 't', "     Todo", ':lua todo_from_terminal()<CR>'),
    button( 'c',  "     Capture", ':lua capture_from_terminal()<CR>'),
    button( "q",    "   Quit", ":qa<CR>"),
    },
    opts = {
        spacing = 0,
    }
}

local section = {
    header = header,
    buttons = buttons,
    footer = footer
}

local opts = {
    layout = {
        {type = "padding", val = 1},
        section.header,
        {type = "padding", val = 1},
        section.buttons,
        {type = "padding", val = 1},
        section.footer,
    },
    opts = {
        margin = 5
    },
}
alpha.setup(opts)
