local M = {}

M.spec = {
  { import = "custom.plugins" }
}

M.opts = {
  defaults = {
    lazy = true,
  },
  -- Based on https://github.com/BastiDood/neovim-rc
  change_detection = {
    enabled = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'tarPlugin',
        'zipPlugin',
        'tohtml',
        'tutor',
        'shada',
        'spellfile',
        'rplugin'
      },
    }
  }

}

function M.setup(_spec, _opts)
  -- Assumption. spec is a list of plugin specs.
  -- Note: vim.list_extend mutates dst (M.spec)
  local spec = vim.list_extend(M.spec, _spec)
  local opts = vim.tbl_deep_extend('force', M.opts, _opts)

  -- Set options, keybinds, commands prior to setting up lazy.nvim
  require("custom.options")
  require("custom.keybinds")
  require("custom.commands")

  require("lazy").setup(spec, opts)
end

return M
