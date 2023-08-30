-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
--- See: https://neovim.io/doc/user/vim_diff.html
--- [2] Defaults - *nvim-defaults*

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd                   -- Execute Vim commands
local exec = vim.api.nvim_exec 	      -- Execute Vimscript
local g = vim.g                       -- Global variables
local opt = vim.opt         		      -- Set options (global/buffer/windows-scoped)
--local fn = vim.fn       				    -- Call Vim functions

g.noshowmode = true -- Disables standart -INSERT-, -NORMAL-, etc
g.noswapfile = true
g.notimeout = true
cmd [[
    set timeout timeoutlen=200
    set notimeout nottimeout
]]
-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = {'menu','menuone','noselect'}  -- Autocomplete options

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true                     -- Show line number
opt.showmatch = true                  -- Highlight matching parenthesis
opt.foldmethod = 'marker'             -- Enable folding (default 'foldmarker')
opt.colorcolumn = ''                  -- Line lenght marker at 80 columns
opt.splitright = true                 -- Vertical split to the right
opt.splitbelow = true                 -- Orizontal split to the bottom
opt.ignorecase = true                 -- Ignore case letters when search
opt.smartcase = true                  -- Ignore lowercase for the whole pattern
opt.smartindent = true                -- Autoindent new lines
opt.linebreak = true                  -- Wrap on word boundary
opt.termguicolors = true              -- Enable 24-bit RGB colors
opt.signcolumn = "yes"                -- Enable gutter for git and other notifications
-- opt.autochdir = true
opt.hlsearch = false                  -- highlight all matches on previous search pattern
opt.incsearch = true                  -- Incremental search is Sick!
opt.updatetime = 50                   -- faster completion
opt.scrolloff = 10
opt.foldenable = false
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.wildmode = "full"
opt.backup = false
-- opt.guicursor = ""
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true                  -- Use spaces instead of tabs
opt.shiftwidth = 4                    -- Shift 4 spaces when tab
opt.softtabstop = 4
opt.tabstop = 4                       -- 1 tab == 4 spaces

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true                     -- Enable background buffers
opt.history = 100                     -- Remember N lines in history
opt.lazyredraw = true                 -- Faster scrolling
opt.synmaxcol = 240                   -- Max column for syntax highlight
-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------

-- Remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
  augroup end
]], false)

-- Don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-- set config files to the correct filetype
cmd [[ autocmd BufNewFile,BufRead *.conf set ft=conf ]]

cmd ':command! WQ wq'
cmd ':command! WQ wq'
cmd ':command! Wq wq'
cmd ':command! Wqa wqa'
cmd ':command! W w'
cmd ':command! Q q'
 -- maintain undo history between sessions

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------

-- Open a terminal pane on the right using :Term
-- cmd [[command Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks:
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]
-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

-- Disable nvim intro
opt.shortmess:append "sI"

-- Disable builtins plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
