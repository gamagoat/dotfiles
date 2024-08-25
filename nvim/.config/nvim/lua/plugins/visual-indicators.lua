return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Set color column indicators at 80 and 120 characters
      vim.opt.colorcolumn = "80,120"
    end,
  },
}
