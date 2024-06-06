require("opts")
require("launch")
require("keymaps")
require("plugin.lastplace")

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Check launch.lua for the plugin spec
require("lazy").setup(LAZY_PLUGIN_SPEC)

-- Create an autocommand group for conform
vim.api.nvim_create_augroup("ConformFormatOnSave", {})

-- Set up the autocommand
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "ConformFormatOnSave",
	callback = function()
		require("conform").format()
	end,
})
