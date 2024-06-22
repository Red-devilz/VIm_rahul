-- Options
local opts = {
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
    foldlevelstart = 0,

	wildmenu = true,
	pumheight = 10,
	pumwidth = 30,

	tw = 90,
	number = true,
	ruler = true,
	hidden = true,
	backspace = "indent,eol,start",
	incsearch = true,
	hlsearch = true,
}

for opt, val in pairs(opts) do
	vim.o[opt] = val
end

vim.cmd("set undofile")

-- Keymaps 
vim.g.maplocalleader = ","

map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end



map("i", "jk", "<esc>")

-- Copy
map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+y')
map("n", "<space>", "za")
map("v", "<space>", "zf")
