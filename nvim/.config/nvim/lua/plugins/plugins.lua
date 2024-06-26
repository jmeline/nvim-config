
return
{
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
  {'numToStr/Comment.nvim', config =
    function()
      require('Comment').setup()
    end
  },
  {'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  -- Autopair
  {'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  { "fatih/vim-go"},
  -- {
  --   "ray-x/go.nvim",
  --   dependencies = {  -- optional packages
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("go").setup()
  --   end,
  --   event = {"CmdlineEnter"},
  --   ft = {"go", 'gomod'},
  --   build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  -- }

  -- Themes
  {'Mofiqul/dracula.nvim', lazy=true},
  {'sainnhe/gruvbox-material', lazy=true},
  {'catppuccin/nvim', lazy=true},
  {'haishanh/night-owl.vim', lazy=true},
  {'folke/tokyonight.nvim', lazy=true},
  {'rebelot/kanagawa.nvim', lazy=true},
  {'morhetz/gruvbox', lazy=true}
}
