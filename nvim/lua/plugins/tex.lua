return {
    {
        "lervag/vimtex",
        ft = "tex",
        config = function()
            vim.cmd([[
                let g:tex_flavor='latex'
                let g:vimtex_quickfix_mode=0
                let g:vimtex_syntax_enabled = 0
                let g:vimtex_view_method='skim'
                let g:vimtex_view_skim_activate=1

                let nvim_server_file = '/tmp/vimtexserver.txt'
                call writefile([v:servername], nvim_server_file)
            ]])
        end
    },
}

