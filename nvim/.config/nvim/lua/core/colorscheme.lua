local opt = vim.opt  -- to set options
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')

local dracula_pro_vim = os.getenv("DRACULA_PRO_VIM_DIR")
opt.runtimepath:append(dracula_pro_vim)

cmd "colorscheme dracula_pro_buffy"
