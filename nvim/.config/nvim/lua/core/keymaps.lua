local map = require("util.funcs").map

-- Change leader to a comma
vim.g.mapleader = ","

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

------------
-- Packer --
------------
map("n", "<leader>ps", ":PackerSync<CR>")

-- Comment.nvim
-- Linewise toggle current line using C-/
map('n', '<leader>c', '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>')
-- Linewise toggle using C-/
map('x', '<leader>c', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
-- Blockwise toggle using <leader>gb
map('x', '<leader>gb', '<ESC><CMD>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>')

---------------
-- Nvim Tree --
---------------
-- map("n", "<leader>n", ":NvimTreeToggle<CR>")

---------------
-- Telescope --
---------------
function createCmd(cmd)
  return "<cmd>lua require('telescope.builtin')."..cmd.."()<CR>"
end

map("n", "<leader>fo", createCmd("find_files"))
map("n", "<leader>fr", createCmd("live_grep"))
map("n", "<leader>fb", createCmd("buffers"))
map("n", "<leader>fh", createCmd("help_tags"))
map("n", "<leader>ft", createCmd("colorscheme"))

map('n', '<leader>o', "<cmd>lua require('fzf-lua').files()<CR>")

--------------
-- Neo Tree --
--------------
map("n", "<leader>n", ":Neotree toggle<CR>")
map("n", "\\", ":Neotree reveal<CR>")


---------------------
-- custom functions--
---------------------
map("n", "<leader>fj", ":%!python3 -m json.tool<CR>")
