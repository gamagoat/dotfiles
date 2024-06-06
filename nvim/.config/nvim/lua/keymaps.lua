local utils = require("utils")

-- Use <Space> as a leader
vim.g.mapleader = " "

-- Open project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')