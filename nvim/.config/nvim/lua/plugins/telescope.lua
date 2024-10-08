local builtin = require("telescope.builtin")

return {
  {
    "nvim-telescope/telescope.nvim",

    keys = {
      -- Override fg to grep files including those from an Obsidian vault
      {
        "<leader>fg",
        function()
          local vault_path = os.getenv("ZETTELKASTEN_PATH")
          builtin.live_grep({
            search_dirs = { vault_path, vim.fn.getcwd() },
            path_display = { "smart" },
          })
        end,
        desc = "Grep files",
      },

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
  },

  -- Plugins for telescope

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>sB",
        ":Telescope file_browser path=%:p:h=%:p:h<cr>",
        desc = "Browse Files",
      },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
}
