local M = {
  "stevearc/conform.nvim",
  -- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#lazy-loading-with-lazynvim
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
}

M.opts = {
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "nixfmt" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_on_save = { timeout_ms = 500 },
  formatters = {},
}

-- M.opts.formatters.<formatter> = {}

return M
