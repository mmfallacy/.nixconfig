local M = {}

M.spec = {
  { import = 'custom.plugins' },
}

M.opts = {
  defaults = {
    lazy = true,
  },
  change_detection = {
    enabled = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        -- From :Lazy profile
        -- Disabling as vim-sleuth will consult editorconfigs by default
        'editorconfig',
        'gzip',
        'man',
        -- "matchit",
        -- "matchparen",
        'netrwPlugin',
        'osc52',
        'rplugin',
        'shada',
        'spellfile',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}

function M.setup(_spec, _opts)
  -- Assumption. spec is a list of plugin specs.
  -- Note: vim.list_extend mutates dst (M.spec)
  local spec = vim.list_extend(M.spec, _spec or {})
  local opts = vim.tbl_deep_extend('force', M.opts, _opts or {})

  -- Set options for the leader keys, then set up lazy, then set up keybinds and commands
  require('custom.options')
  require('lazy').setup(spec, opts)
  require('custom.keybinds')
  require('custom.commands')
end

return M
