-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = ".env*",
  command = "set filetype=sh",
})

-- ObsidianNvim
vim.api.nvim_create_user_command("ON", "ObsidianNew", {})
vim.api.nvim_create_user_command("OT", "ObsidianTag", {})
