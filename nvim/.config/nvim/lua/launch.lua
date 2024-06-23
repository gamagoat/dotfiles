-- Plugins go in this table
LAZY_PLUGIN_SPEC = {
	-- Glow
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		tag = "0.1.6",
		cmd = "Telescope",
		config = function()
			local builtin = require("telescope.builtin")

			-- Find hidden files using ripgrep, but not if they live in .git
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({
					find_command = {
						"rg",
						-- List files
						"--files",
						-- Include hidden files and directories
						"--hidden",
						-- Exclude .git directories and their contents
						"--glob",
						"!.git/*",
					},
				})
			end, {})

			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					-- Arguments to pass when grepping
					vimgrep_arguments = {
						"rg",
						-- Show color in output if in an interactive terminal
						"--color=auto",
						-- Prevent printing filenames above matching content
						"--no-heading",
						-- Include filename in the output
						"--with-filename",
						-- Include line number in the output
						"--line-number",
						-- Include column number in the output
						"--column",
						-- Case-insensitive search if pattern is all lowercase, case-sensitive otherwise
						"--smart-case",
						-- Include hidden files and directories in the search
						"--hidden",
						-- Exclude .git directories and their contents
						"--glob",
						"!.git/*",
					},
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,

							["<C-q>"] = actions.close,
						},
						n = {
							["<esc>"] = actions.close,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["q"] = actions.close,
						},
					},
				},
			})
		end,
	},

	-- Visual Multi
	{ "mg979/vim-visual-multi", branch = "master", lazy = false },

	-- Conform
	{
		"stevearc/conform.nvim",
		lazy = false,
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				-- Which parsers to install
				ensure_installed = { "c", "css", "bash", "go", "html", "lua", "query", "vim", "vimdoc" },
				-- Whether to install parsers synchronously
				sync_install = true,
				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,
				highlight = { enable = true },
				-- Indentation for the `=` operator
				indent = { enable = true },
			})
		end,
	},

	{ "rebelot/kanagawa.nvim", priority = 1000 },
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
} -- end LAZY_PLUGIN_SPEC

function spec(item)
	table.insert(LAZY_PLUGIN_SPEC, { import = item })
end
