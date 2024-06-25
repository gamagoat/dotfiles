local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",

  keys = {
    -- Override fg to grep files
    { "<leader>fg", builtin.live_grep, desc = "Grep files" },

    -- Disable the old grep keymap
    { "<leader>/", false },
  },

  defaults = {
    -- Arguments to pass when grepping
    vimgrep_arguments = {
      "rg",
      -- Show color in output if in an interactive terminal
      "--color=auto",
      -- Prevent printing filenames above matching content
      "--no-heading",
      -- Include filename in the output
      "--with-filename",
      -- Include line number in the output
      "--line-number",
      -- Include column number in the output
      "--column",
      -- Case-insensitive search if pattern is all lowercase, case-sensitive otherwise
      "--smart-case",
      -- Include hidden files and directories in the search
      "--hidden",
      -- Exclude .git directories and their contents
      "--glob",
      "!.git/*",
    },
  },
}
