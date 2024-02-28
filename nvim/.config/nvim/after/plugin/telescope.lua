-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')

-- customize telescope to jump to nvim config from anywhere
local _edit_neovim = function()
  builtin.git_files {
    shorten_path = true,
    cwd = "~/.config/nvim",
    prompt = "~ dotfiles ~",
    height = 10,
    layout_strategy = 'horizontal',
    layout_options = {
      preview_width = 0.75,
    }
  }
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>fp', builtin.planets, {})

vim.keymap.set('n', '<leader>en', _edit_neovim, {})

