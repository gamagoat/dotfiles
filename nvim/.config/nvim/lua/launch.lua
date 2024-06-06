-- Plugins go in this table
LAZY_PLUGIN_SPEC = {
  {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
  {{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          -- Which parsers to install
          ensure_installed = { "c", "bash", "lua", "query", "vim", "vimdoc",  },
          -- Whether to install parsers synchronously
          sync_install = false,
          -- Automatically install missing parsers when entering buffer
          -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
          auto_install = true,
          highlight = { enable = true },
          -- Indentation for the `=` operator
          indent = { enable = true },  
        })
    end
 }},
}

function spec(item)
	table.insert(LAZY_PLUGIN_SPEC, { import = item })
end



