return {
  {'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = {{'nvim-lua/plenary.nvim'}}},
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  {'nvim-treesitter/playground'},
  {'akinsho/toggleterm.nvim'},
  {'nvim-lua/popup.nvim'},
  {'nvim-lualine/lualine.nvim'},
  {'machakann/vim-sandwich'},
  {'mbbill/undotree'},

  -- FZF: Fast searching
  {'ibhagwan/fzf-lua', dependencies = {"nvim-tree/nvim-web-devicons"}},
  {'junegunn/fzf', build= './install --bin'},
  {'numToStr/Comment.nvim' },
  {'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {"folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
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

  -- Themes
  {'Mofiqul/dracula.nvim'},
  {'sainnhe/gruvbox-material'},
  {'catppuccin/nvim'},
  {'haishanh/night-owl.vim'},
  {'folke/tokyonight.nvim'},
  {'rebelot/kanagawa.nvim'},
  {'morhetz/gruvbox'}
}
