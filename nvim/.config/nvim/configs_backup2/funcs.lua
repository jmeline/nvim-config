
local api = vim.api  -- invoke nvim api functions

----- utility functions -------

local funcs = {}

function funcs.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

return funcs
