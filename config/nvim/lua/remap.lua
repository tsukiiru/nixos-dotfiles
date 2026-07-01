-- file to remap keys / add key binds
vim.keymap.set("v", "< S-Down> ", ":m '> +1< CR> gv=gv")
vim.keymap.set("v", "< S-Up> ", ":m '<-2< CR> gv=gv")

vim.keymap.set("v", "< Tab> ", "> gv")
vim.keymap.set("v", "< S-Tab> ", "< gv")

vim.keymap.set("x", "< leader> p", '"_dP')
vim.keymap.set("v", "< leader> y", '"+y')

vim.keymap.set("n", "< leader> cac", ":%s/< C-r> < C-w> /< C-r> < C-w> /gIc< Left> < Left> < Left> < Left> ")
