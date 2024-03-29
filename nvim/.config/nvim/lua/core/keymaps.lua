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
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make the current file executable without having to leave the editor
map("n", "<leader>x", "<cmd>!chmod +x %<CR>")
-- Move block of code up
map("v", "K", ":m '<-2<CR>gv=gv")
-- Move block of code down
map("v", "J", ":m '>+1<CR>gv=gv")
-- keep cursor in the same place when joining lines
map("n", "J", "mzJ`z")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- keep cursor in the middle while searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "<leader>p", [["_dP]])

---------------------
-- custom functions--
---------------------
map("n", "<leader>fj", ":%!python3 -m json.tool<CR>")

-- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
-- see also: 'follow_url_func' config option above.
vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })
