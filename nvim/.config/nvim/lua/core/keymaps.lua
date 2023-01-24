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
------------
-- Packer --
------------
map("n", "<leader>ps", ":PackerSync<CR>")

---------------
-- Nvim Tree --
---------------
-- map("n", "<leader>n", ":NvimTreeToggle<CR>")

---------------
-- Telescope --
---------------
-- function createCmd(cmd)
--   return "<cmd>lua require('telescope.builtin')."..cmd.."()<CR>"
-- end
--
-- map("n", "<leader>fo", createCmd("find_files"))
-- map("n", "<leader>fr", createCmd("live_grep"))
-- map("n", "<leader>fb", createCmd("buffers"))
-- map("n", "<leader>fh", createCmd("help_tags"))
-- map("n", "<leader>ft", createCmd("colorscheme"))
--
-- map('n', '<leader>o', "<cmd>lua require('fzf-lua').files()<CR>")

--------------
-- Neo Tree --
--------------
map("n", "<leader>n", ":Neotree toggle<CR>")
map("n", "\\", ":Neotree reveal<CR>")


---------------------
-- custom functions--
---------------------
map("n", "<leader>fj", ":%!python3 -m json.tool<CR>")
