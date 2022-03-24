-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "maintained",
--   highlight = {
--     enable = true
--   }
-- }
require'nvim-treesitter.configs'.setup {
    -- ensure_installed = "maintained",
    ensure_installed = {
        "javascript",
        "clojure",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        -- "python"
        -- "rust",
        -- "go"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    indent = {
      enable = true
    }
}

local opt = vim.opt  -- to set options
-- folding support
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
