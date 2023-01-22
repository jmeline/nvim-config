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
        "rust",
        "toml",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        "hcl" -- terraform
        -- "python"
        -- "go"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    indent = {
      enable = true
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil
  }
}

local opt = vim.opt  -- to set options
-- folding support
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
