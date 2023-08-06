local map = require("core.utils").map

-- key mappings
map('n', '<leader>e', "<cmd>lua require('fzf-lua').files()<CR>")
