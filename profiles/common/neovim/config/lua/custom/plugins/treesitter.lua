local M = {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
}

local N = {
  'nvim-treesitter/nvim-treesitter-context',
  opts = {},
}

M.keys = {
  {
    'c[',
    function()
      require('treesitter-context').go_to_context()
    end,
  },
}

M.event = { 'BufReadPost', 'BufNewFile' }

M.opts = {
  indent = {
    enable = true,
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  context_commentstring = {
    enable = true,
  },
}

local ensure_installed = {
  -- Based on LazyVim's default ensure_installed.
  'bash',
  'c',
  'diff',
  'html',
  'javascript',
  'jsdoc',
  'json',
  'jsonc',
  'lua',
  'luadoc',
  'luap',
  'markdown',
  'markdown_inline',
  'printf',
  'python',
  'query',
  'regex',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'xml',
  'yaml',
  -- Self
  'nix',
}

-- This function checks if ensure_installed matches the available parsers. If not, it warns the user.
local function check_parsers()
  local utils = require('nvim-treesitter.utils')
  local parsers = require('nvim-treesitter.info').installed_parsers()
  local diff = utils.difference(ensure_installed, parsers)
  if #diff > 0 then
    vim.notify_once(
      'plugins/treesitter.lua: ensured_installed parsers not met. ' .. vim.inspect(diff) .. ' are missing!',
      vim.log.levels.WARN
    )
  end
end

function M.config(_, opts)
  require('nvim-treesitter.configs').setup(opts)
  check_parsers()
end

return {
  N,
  M,
}
