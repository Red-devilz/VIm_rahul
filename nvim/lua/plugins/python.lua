return {
    {
        "rahul13ramesh/SimpylFold",
        ft = "python",
        config = function()
            vim.cmd([[
                let g:SimpylFold_docstring_preview = 1
                hi Folded guibg=None guifg=grey
            ]])
        end
    },
}

