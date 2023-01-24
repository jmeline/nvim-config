local map = require("core.utils").map

-- Change leader to a comma
vim.g.mapleader = ","

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

map("i", "jk", "<ESC>")
map("n", ";", ":")
map("n", "j", "gj")
map("n", "k", "gk")

-- Don't use arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map("i", "<slient> <ESC>", "<C-O>:stopinsert<CR>")

map("n", "Y", "y$")
map("n", "<leader>y", '"*y')
map("n", "<leader>p", '"*p')
map("n", "<leader>Y", '"+y')
map("n", "<leader>P", '"+p')

-- begin substituting the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make the current file executable without having to leave the editor
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- Move block of code up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Move block of code down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- keep cursor in the same place when joining lines
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keep cursor in the middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])

------------
-- prevents --
------------
map("n", "<leader>ps", ":PackerSync<CR>")

---------------
-- Nvim Tree --
---------------
-- map("n", "<leader>n", ":NvimTreeToggle<CR>")

--------------
-- Neo Tree --
--------------
map("n", "<leader>n", ":Neotree toggle<CR>")
map("n", "\\", ":Neotree reveal<CR>")

---------------------
-- custom functions--
---------------------
map("n", "<leader>fj", ":%!python3 -m json.tool<CR>")
