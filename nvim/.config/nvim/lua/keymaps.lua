-- Use <Space> as a leader
vim.g.mapleader = " "

local keymap_opts = {
  -- No recursive mappings
  noremap = true,
}

-- Open project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


