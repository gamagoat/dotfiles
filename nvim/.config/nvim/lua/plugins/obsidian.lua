return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- Only load obsidian.nvim for markdown files in the default vault
  event = {
    "VimEnter " .. vim.fn.expand(vim.fn.getenv("DEFAULT_OBSIDIAN_VAULT")),
    "BufReadPre " .. vim.fn.expand(vim.fn.getenv("DEFAULT_OBSIDIAN_VAULT")) .. "/*.md",
    "BufNewFile " .. vim.fn.expand(vim.fn.getenv("DEFAULT_OBSIDIAN_VAULT")) .. "/*.md",

    "VimEnter " .. vim.fn.expand(vim.fn.getenv("SECONDARY_OBSIDIAN_VAULT")),
    "BufReadPre " .. vim.fn.expand(vim.fn.getenv("SECONDARY_OBSIDIAN_VAULT")) .. "/*.md",
    "BufNewFile " .. vim.fn.expand(vim.fn.getenv("SECONDARY_OBSIDIAN_VAULT")) .. "/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "default",
        path = vim.fn.expand(vim.fn.getenv("DEFAULT_OBSIDIAN_VAULT")),
      },
      {
        name = "secondary",
        path = vim.fn.expand(vim.fn.getenv("SECONDARY_OBSIDIAN_VAULT")),
      },
    },

    notes_subdir = "00-zettelkasten",
    new_notes_location = "notes_subdir",

    templates = {
      folder = "templates/",
    },

    daily_notes = {
      folder = "01-dailies",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily-notes" },
      template = "daily.md",
    },

    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in the format YYYY-MM-DD-HH-MM-SS-title
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into a valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      -- Get the current date and time in the format YYYY-MM-DD-HH-MM-SS
      local date_time = os.date("%Y-%m-%d-%H-%M-%S")
      return date_time .. "-" .. suffix
    end,
  },
}
