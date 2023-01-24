local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local execute = vim.api.nvim_command

-- Auto install packer if it does not exist
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
	return string.format('require("configs/%s")', name)
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use ('wbthomason/packer.nvim')

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use 'akinsho/toggleterm.nvim'
  use 'nvim-lua/popup.nvim'
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-cmdline'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  use ('mbbill/undotree')

  -- use 'onsails/lspkind-nvim'
  use 'kyazdani42/nvim-web-devicons'               -- for file icons
  -- use 'kyazdani42/nvim-tree.lua'                   -- file explorer in lua
  use 'hoob3rt/lualine.nvim'                       -- blazingly fast statusline
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
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

  --'tomtom/tcomment_vim'
  -- 'tpope/vim-commentary'

  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  use 'machakann/vim-sandwich'
  -- use 'mattn/emmet-vim'
  -- use 'peitalin/vim-jsx-typescript'
  use 'Mofiqul/dracula.nvim'

  use 'adelarsq/neofsharp.vim'
  use 'hashivim/vim-terraform'
  use 'simrat39/rust-tools.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
