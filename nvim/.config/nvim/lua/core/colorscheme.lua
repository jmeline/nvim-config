local opt = vim.opt  -- to set options
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')

local dracula_pro_vim = os.getenv("DRACULA_PRO_VIM_DIR")

-- print(dracula_pro_vim)
--
-- local theme = "dracula_pro_buffy"
--
-- if not dracula_pro_vim then
--   theme = "dracula"
-- end

-- print(theme)

-- load up personal colorscheme --
opt.runtimepath:append(dracula_pro_vim)
cmd "colorscheme dracula_pro_buffy"
