local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local execute = vim.api.nvim_command

-- Auto install packer if it does not exist
local data_path = fn.stdpath('data')
local compile_path = data_path..'/site/plugin/packer_compiled.lua'
local install_path = data_path..'/site/pack/packer/start/packer.nvim'

-- Bootstrap Packer
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	execute("packadd packer.nvim")
end

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
	return string.format('require("configs/%s")', name)
end

-- initialize and configure packer
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.init({
	enable = true, -- enable profiling via :PackerCompile profile=true
	threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
})

packer.startup(function(use)
  use ('wbthomason/packer.nvim')
  use ({
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  })
  use ('nvim-lua/lsp_extensions.nvim')
  use ('nvim-lua/completion-nvim')
  use ({"numToStr/Navigator.nvim", config = get_config("navigator")})
  use ('rafamadriz/friendly-snippets')

  use ({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp'},
    config = get_config("cmp")
  })                        -- completion provided in lua


  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'onsails/lspkind-nvim'
  use 'kyazdani42/nvim-web-devicons'               -- for file icons
  -- use 'kyazdani42/nvim-tree.lua'                   -- file explorer in lua
  use 'hoob3rt/lualine.nvim'                       -- blazingly fast statusline
  use ({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })
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

  use 'mattn/emmet-vim'
  use 'peitalin/vim-jsx-typescript'
  use 'Pocco81/TrueZen.nvim'
  use 'Mofiqul/dracula.nvim'

  use 'adelarsq/neofsharp.vim'
  use 'hashivim/vim-terraform'
end)
