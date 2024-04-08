return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function ()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
    dependencies = {
      -- {'neovim/nvim-lspconfig'}, -- required
      {'williamboman/mason.nvim', build = ":MasonUpdate"}, -- optional
      {'williamboman/mason-lspconfig.nvim'}, -- optional

      -- Autocompletion
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-nvim-lsp'}, -- required
      {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-cmdline'},

      -- Snippets
      {'L3MON4D3/LuaSnip'}, -- required
      {'rafamadriz/friendly-snippets'},
    }
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        })
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      -- (Optional) Configure lua language server for neovim
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end
  }
}
-- dependencies = {
  --   -- LSP Support
  --   {'neovim/nvim-lspconfig'}, -- required
  --   {'williamboman/mason.nvim', build = ":MasonUpdate"}, -- optional
  --   {'williamboman/mason-lspconfig.nvim'}, -- optional
  --
  --   -- Autocompletion
  --   {'saadparwaiz1/cmp_luasnip'},
  --   {'hrsh7th/nvim-cmp'},
  --   {'hrsh7th/cmp-buffer'},
  --   {'hrsh7th/cmp-path'},
  --   {'hrsh7th/cmp-nvim-lsp'}, -- required
  --   {'hrsh7th/cmp-nvim-lua'},
  --   {'hrsh7th/cmp-cmdline'},
  --
  --   -- Snippets
  --   {'L3MON4D3/LuaSnip', tag = "v2.*", run = "make install_jsregexp" }, -- required
  --   {'rafamadriz/friendly-snippets'},
  -- }
