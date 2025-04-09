-- Plugins not loaded! Only loaded when .nvim.lua explicitly loads it
local M = {
  'jghauser/follow-md-links.nvim',
}

return {
  {
    'klen/nvim-config-local',
    opts = {
      -- Explicitly handle only .nvim.lua files!
      config_files = { '.nvim.lua' },
    },
    lazy = false,
  },
  M,
}
