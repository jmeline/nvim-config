vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- https://github.com/neovim/neovim/issues/15720
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
