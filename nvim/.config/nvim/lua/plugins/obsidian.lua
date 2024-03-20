return
{
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    -- "BufReadPre " .. vim.fn.expand "~" .. "/code/vault/**.md",
    -- "BufNewFile " .. vim.fn.expand "~" .. "/code/vault/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
    -- Completion:
    "hrsh7th/nvim-cmp",

    -- Pickers:
    "nvim-telescope/telescope.nvim",

    -- Syntax Highlighting
    "nvim-treesitter"
  },
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
    { "<leader>ol", "<cmd>ObsidianLinkNew<cr>", desc = "New Obsidian link", mode = "n" },
    { "<leader>oo", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n" },
    { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n" },
    { "<leader>of", "<cmd>ObsidianFollowLink<cr>", desc = "Follow link under cursor", mode = "n" },
    { "<leader>ow", "<cmd>ObsidianWorkspaces<cr>", desc = "Change Obsidian Workspaces", mode = "n" },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/code/vault/personal",
      },
      {
        name = "drivetime",
        path = "~/code/vault/drivetime",
      }
    },

    nodes_subdir = "notes",

    -- Where to put new notes. Valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
    new_notes_location = "current_dir",

    daily_notes = {
      folder = "notes/dailies",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
    },

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    mappings = {
      -- "Obsidian follow"
      -- ["gf"] = {
      --   action = function()
      --     return require("obsidian").util.gf_passthrough()
      --   end,
      --   opts = { noremap = false, expr = true, buffer = true },
      -- },
      -- Toggle check-boxes "obsidian done"
      ["<leader>od"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },

    -- Optional, customize how names/IDs for new notes are created.
    note_id_func = function(title)
      return title
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      -- local suffix = ""
      -- if title ~= nil then
      --   -- If title is given, transform it into valid file name.
      --   suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      -- else
      --   -- If title is nil, just add 4 random uppercase letters to the suffix.
      --   for _ = 1, 4 do
      --     suffix = suffix .. string.char(math.random(65, 90))
      --   end
      -- end
      -- return tostring(os.time()) .. "-" .. suffix
    end,

    -- Optional, customize how wiki links are formatted.
    ---@param opts {path: string, label: string, id: string|?}
    ---@return string
    wiki_link_func = function(opts)
      print(opts)
      if opts.id == nil then
        return string.format("[[%s]]", opts.label)
      elseif opts.label ~= opts.id then
        return string.format("[[%s|%s]]", opts.id, opts.label)
      else
        return string.format("[[%s]]", opts.id)
      end
    end,

    -- Either 'wiki' or 'markdown'.
    preferred_link_style = 'markdown',

    -- Optional, customize how markdown links are formatted.
    ---@param opts {path: string, label: string, id: string|?}
    ---@return string
    markdown_link_func = function(opts)
      print("HIHIHIHIHIH", opts)
      return string.format("[%s]", opts.label)
      -- return string.format("[%s](%s)", opts.label, opts.path)
    end,


    -- Optional, for templates (see below).
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      local OS = vim.loop.os_uname().sysname
      if OS == "Darwin" then
        vim.fn.jobstart({"open", url})  -- Mac OS
      elseif OS == "Linux" then
        vim.fn.jobstart({"xdg-open", url})  -- linux
      else
        print("Unsupported OS")
      end
    end,

    -- Specify how to handle attachments.
    attachments = {
      -- The default folder to place images in via `:ObsidianPasteImg`.
      -- If this is a relative path it will be interpreted as relative to the vault root.
      -- You can always override this per image by passing a full path to the command instead of just a filename.
      img_folder = "media/imgs",  -- This is the default
      -- A function that determines the text to insert in the note when pasting an image.
      -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
      -- This is the default implementation.
      ---@param client obsidian.Client
      ---@param path obsidian.Path the absolute path to the image file
      ---@return string
      img_text_func = function(client, path)
        local link_path
        local vault_relative_path = client:vault_relative_path(path)
        if vault_relative_path ~= nil then
          -- Use relative path if the image is saved in the vault dir.
          link_path = vault_relative_path
        else
          -- Otherwise use the absolute path.
          link_path = tostring(path)
        end
        local display_name = vim.fs.basename(link_path)
        return string.format("![%s](%s)", display_name, link_path)
      end,
    },

    -- see below for full list of options 👇
  },
}
