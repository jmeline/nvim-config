local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  hidden = true
})

function _lazygit_toggle()
    lazygit:toggle()
end

local map = require("core.utils").map

map("n", "<F5>", "<cmd>lua _lazygit_toggle()<CR>", {
  noremap = true,
  silent = true
})
