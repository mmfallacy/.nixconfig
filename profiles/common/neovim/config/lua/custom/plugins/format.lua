local M = {
  'stevearc/conform.nvim',
  -- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#lazy-loading-with-lazynvim
  event = 'BufWritePre',
  cmd = 'ConformInfo',
  keys = {
    {
      '<leader>fd',
      function()
        require('conform').format({ async = true })
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
}

M.opts = {
  formatters_by_ft = {
    lua = { 'stylua' },
    nix = { 'nixfmt' },
    markdown = { 'prettier_md' },
    ['*'] = { 'injected' },
    bash = { 'shfmt' },
  },
  default_format_opts = {
    lsp_format = 'fallback',
  },
  format_on_save = { timeout_ms = 500 },
  formatters = {},
}

-- Instantiate prettier for markdown.
-- https://github.com/stevearc/conform.nvim/issues/339
local function create_prettier_md()
  local prettier_md = vim.deepcopy(require('conform.formatters.prettier'))
  --
  -- stylua: ignore
  local overrides = {
    -- Ignore cli when a valid prettierconfig is present
    "--config-precedence", "prefer-file",
    -- .editorconfigs are resolved as prettierconfig
    "--no-editorconfig",
    -- Define overrides here!
    -- "--print-width", "120",
    -- "--prose-wrap", "always", -- No need to manually `gq`. Auto reflow on save
  }

  require('conform.util').add_formatter_args(prettier_md, overrides, { append = false })

  return prettier_md
end

M.config = function(_, opts)
  local conform = require('conform')
  conform.setup(opts)

  conform.formatters.prettier_md = create_prettier_md()
end

-- M.opts.formatters.<formatter> = {}

return M
