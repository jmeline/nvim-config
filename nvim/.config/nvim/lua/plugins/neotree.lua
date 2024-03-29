return
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {"<leader>n", "<cmd>Neotree toggle<cr>", desc = "NeoTree"},
    {"<leader>r", "<cmd>Neotree reveal<cr>", desc = "NeoTree"},
  }
}
