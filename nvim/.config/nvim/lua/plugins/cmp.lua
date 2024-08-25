return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        -- Tab to confirm the autocomplete suggestion
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),

        -- Enter should not confirm the autocomplete suggestion; it should insert a newline
        ["<CR>"] = cmp.mapping(function(fallback)
          fallback() -- This ensures the Enter key inserts a newline instead of confirming a suggestion
        end, { "i", "s" }),

        -- Space should not confirm the autocomplete suggestion; it should insert a space
        ["<Space>"] = cmp.mapping(function(fallback)
          fallback() -- This ensures the Space key inserts a space instead of confirming a suggestion
        end, { "i", "s" }),
      })
    end,
  },
}
