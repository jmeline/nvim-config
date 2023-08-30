return
{
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'}, -- required
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
  },
}
