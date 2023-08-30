local map = require("core.utils").map

return
{
  "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      map("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
      map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
      map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
      map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>")
      map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
      map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>")
    end
}
