local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()

-- Auto install packer if it does not exist
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

cmd [[packadd packer.nvim]]

require'packer'.startup(function()
  use 'wbthomason/packer.nvim'
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  use 'nvim-lua/lsp_extensions.nvim'
  use 'nvim-lua/completion-nvim'

  use 'rafamadriz/friendly-snippets'
  use 'hrsh7th/vim-vsnip'

  use 'hrsh7th/nvim-compe'                        -- completion provided in lua
  use 'onsails/lspkind-nvim'
  use 'kyazdani42/nvim-web-devicons'               -- for file icons
  use 'kyazdani42/nvim-tree.lua'                   -- file explorer in lua
  use 'hoob3rt/lualine.nvim'                       -- blazingly fast statusline
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use "p00f/nvim-ts-rainbow"      -- rainbow parentheses for neovim
  use { 'ibhagwan/fzf-lua',
  -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use { 'junegunn/fzf', run = './install --bin' }

  -- 'junegunn/fzf';
  -- 'junegunn/fzf.vim';

  use 'akinsho/toggleterm.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  }

  use 'machakann/vim-sandwich'
  --'tomtom/tcomment_vim'
  -- 'tpope/vim-commentary'
  --'tpope/vim-fugitive'

  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }
  use 'christoomey/vim-tmux-navigator'

  use 'mattn/emmet-vim'
  use 'peitalin/vim-jsx-typescript'
  use 'Pocco81/TrueZen.nvim'
  use 'Mofiqul/dracula.nvim'

  use 'adelarsq/neofsharp.vim'
end)
