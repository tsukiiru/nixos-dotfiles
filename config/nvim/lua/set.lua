-- set the line numbers & relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- set spaces for tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- highlight search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- set terminal to be 256 colors
vim.opt.termguicolors = true

-- leave margin to the left
vim.opt.scrolloff = 8

-- set update time (ms)
vim.opt.updatetime = 50

-- disable some columns
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = ""

-- set spelling
vim.opt.spell = false

-- set to system clipboard
vim.opt.clipboard = "unnamedplus"

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable hover events
vim.opt.mousemoveevent = true
