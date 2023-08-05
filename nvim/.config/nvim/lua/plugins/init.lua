return {
  {'wbthomason/packer.nvim'},
  {'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = {{'nvim-lua/plenary.nvim'}}},
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  {'nvim-treesitter/playground'},
  {'akinsho/toggleterm.nvim'},
  {'nvim-lua/popup.nvim'},
  {'VonHeikemen/lsp-zero.nvim',
    dependencies = {
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
  },
  {'mbbill/undotree'},

  -- FZF: Fast searching
  {'ibhagwan/fzf-lua', dependencies = {"kyazdani42/nvim-web-devicons"}},
  {'junegunn/fzf', build= './install --bin'},
  {'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
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
  },
  { 'alexghergh/nvim-tmux-navigation', config = function()
    require('nvim-tmux-navigation').setup {
      disable_when_zoomed = true, -- defaults to false
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      }
    }
    end
  },

  -- Autopair
  {'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },

  {'machakann/vim-sandwich'},

  -- Themes
  {'Mofiqul/dracula.nvim'},
  {'sainnhe/gruvbox-material'},
  {'catppuccin/nvim'},
  {'haishanh/night-owl.vim'},
  {'folke/tokyonight.nvim'},
  {'rebelot/kanagawa.nvim'},
  {'morhetz/gruvbox'},

  {'adelarsq/neofsharp.vim'},
  {'hashivim/vim-terraform'},
  {'simrat39/rust-tools.nvim'},
}