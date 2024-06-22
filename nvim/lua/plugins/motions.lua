return {
    {
        "rhysd/clever-f.vim",
        event={"BufReadPre", "BufNewFile"}
    },
    {
        "tpope/vim-repeat",
        event={"BufReadPre", "BufNewFile"}
    },
    {
        "ggandor/leap.nvim",
        config = function()
            require('leap').create_default_mappings()
        end
    },
    {
        'numToStr/Comment.nvim',
        event={"BufReadPre", "BufNewFile"},
        opts = {
            mappings = {
                basic = true,
                extra = false,
            },
            opleader = {
                line = '<leader>c',
                block = '<leader>b',
            },
            toggler = {
                line = '<leader>c<space>',
                block = '<leader>b<space>',
            }
        }
    },
    {
        "wellle/targets.vim",
        event={"BufReadPre"},
    },
}
