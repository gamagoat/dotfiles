-- Use <Space> as a leader
vim.g.mapleader = " "

local keymap_opts = {
  -- No recursive mappings
  noremap = true,
}

-- Open project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')

