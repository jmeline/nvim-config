local g   = vim.g

require'nvim-tree'.setup {
  disable_netrw       = true,  -- disables netrw completely
  hijack_netrw        = true,  -- hijack netrw window on startup
  open_on_setup       = false, -- open the tree when running this setup function
  ignore_ft_on_setup  = {},    -- will not open on setup if the filetype is in this list
  auto_close          = false, -- closes neovim automatically when the tree is the last **WINDOW** in the view
  open_on_tab         = false,
  hijack_cursor       = false, -- hijack the cursor in the tree to put it at the start of the filename
  update_cwd          = false, -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  -- show lsp diagnostics in the signcolumn
  update_to_buf_dir   = {      -- hijacks new directory buffers when they are opened.
    enable = true,
    auto_open = true,          -- allow to open the tree if it was previously closed
  },
  nvim_tree_hide_dotfiles = 1,
  nvim_tree_ignore = {
    ".git",
    "node_modules",
    ".cache"
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 30,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}

-- opt.termguicolors = true

g.nvim_tree_side = "left"
g.nvim_tree_width = 25
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":t"
g.nvim_tree_allow_resize = 1
g.nvim_tree_highlight_opened_files= 3

g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1
}

-- g.nvim_tree_icons = {
--   default = " ",
--   symlink = " ",
--   git = {
--       unstaged = "✗",
--       staged = "✓",
--       unmerged = "",
--       renamed = "➜",
--       untracked = "★",
--       deleted = "",
--       ignored = "◌"
--   },
--   folder = {
--       default = "",
--       open = "",
--       symlink = "",
--       empty = "",
--       empty_open = "",
--       symlink_open = ""
--   }
-- }

g.nvim_tree_icons = {
 default      = "",
 symlink      = "",
 git = {
  unstaged    = "✗",
  staged      = "✓",
  unmerged    = "",
  renamed     = "➜",
  untracked   = "★",
  deleted     = "",
 },
 folder = {
  arrow_open  = "",
  arrow_closed= "",
  default     = "",
  open        = "",
  empty       = "",
  empty_open  = "",
  symlink     = "",
  symlink_open= "",
 },
 lsp = {
   hint       = "",
    info      = "",
    warning   = "",
    error     = "",
  }
 }
