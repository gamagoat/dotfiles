return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- Show hidden files
          hide_gitignored = false, -- Show git ignored files
        },
      },
    },
  },
}
