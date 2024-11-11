return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["markdown"] = { "prettierd", "markdownlint", "markdown-toc" },
        ["sh"] = { "shfmt" },
        ["cue"] = { "cue_fmt" },
      },
    },
  },
}
