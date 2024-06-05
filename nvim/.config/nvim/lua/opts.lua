-- Locals
local tab_width=2


-- Show line number
vim.opt.number = true
-- Show relative line number
vim.opt.relativenumber = true
-- Use spaces instead of tabs
vim.opt.tabstop = tab_width
vim.opt.softtabstop = tab_width
vim.opt.expandtab = true
-- Sets amount of spaces to use for auto indents
vim.opt.shiftwidth = tab_width
-- Do not wrap text
vim.opt.wrap = false
-- Expand search as characters are typed
vim.opt.incsearch = false
-- Disable swap files
vim.opt.swapfile = false
-- Use an undo dir
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- Enable the sign column
vim.opt.signcolumn = "yes"
-- Enable the color column at a certain number of characters
vim.opt.colorcolumn = "120"
