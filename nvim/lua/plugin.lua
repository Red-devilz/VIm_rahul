local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
    }) 
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ","

local plugins = { 
    require("plugins.ui"),
    require("plugins.motions"),
    require("plugins.completion"),
    require("plugins.git"),
    require("plugins.treesitter"),
    require("plugins.explorer"),
    require("plugins.tex"),
    require("plugins.python"),
    require("plugins.notes"),
}

require("lazy").setup(plugins, {
	ui = {
		size = { width = 0.4, height = 0.7 },
		border = "rounded",
	},
})

