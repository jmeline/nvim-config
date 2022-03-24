------------------------ HELPERS ------------------------------
-- local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
-- local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
-- local opt = vim.opt  -- to set options
-- local o = vim.o
-- local g = vim.g      -- a table to access global variables

require "core/settings"
require "core/keymaps"
require "core/colorscheme"
require "packer_init"

-------------------- Load PLUGINS ----------------------------------
require "plugins/nvim-tree"
require "plugins/lualine"
require "plugins/compe-completion"
require "plugins/nvim-lsp-installer"
require "plugins/nvim-lspconfig"
require "plugins/nvim-treesitter"
require "plugins/nvim-ts-rainbow"
require "plugins/toggleterm"
require "plugins/telescope"

-- require "plugins/vsnip-config"

-- map('n', '<leader>o', '<cmd>Files<CR>')
-- map('n', '<leader>r', '<cmd>Rg<CR>')
-- map('n', '<leader>/', '<cmd>BLines<CR>')
-- map('n', '<leader>;', '<cmd>History:<CR>')
-- map('n', '<leader>g', '<cmd>GitFiles<CR>')
