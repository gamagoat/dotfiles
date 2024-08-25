return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- Only load obsidian.nvim for markdown files in the default vault
  event = {
    "VimEnter " .. vim.fn.expand(vim.fn.getenv("DEFAULT_OBSIDIAN_VAULT")),
    "BufReadPre " .. vim.fn.expand(vim.fn.getenv("DEFAULT_OBSIDIAN_VAULT")) .. "/*.md",
    "BufNewFile " .. vim.fn.expand(vim.fn.getenv("DEFAULT_OBSIDIAN_VAULT")) .. "/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = vim.fn.expand(vim.fn.getenv("DEFAULT_OBSIDIAN_VAULT")),
      },
    },
  },
}
