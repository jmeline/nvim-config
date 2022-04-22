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

  use 'hrsh7th/nvim-cmp'                        -- completion provided in lua
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

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

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim"
    },
    config = function ()
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError",
      {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
      {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
      {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
      {text = "", texthl = "DiagnosticSignHint"})
      -- NOTE: this is changed from v1.x, which used the old style of highlight groups
      -- in the form "LspDiagnosticsSignWarning"
    end
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
  use 'hashivim/vim-terraform'
end)
