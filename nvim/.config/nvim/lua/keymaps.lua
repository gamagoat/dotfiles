local utils = require("utils")

-- Open project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')

-- Conform
vim.keymap.set('n', '<leader>cf', function()
  require('conform').format()
end, { noremap = true, desc = "Format code" })