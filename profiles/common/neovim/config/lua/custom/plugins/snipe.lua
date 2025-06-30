return {
  'leath-dub/snipe.nvim',
  keys = {
    {
      'gb',
      function()
        require('snipe').open_buffer_menu()
      end,
    },
  },
  opts = {
    ui = {
      position = 'center',
    },
  },

  -- require('snipe') isn't available when used directly in opts
  config = function(_, opts)
    local snipe = require('snipe')
    opts.ui.preselect = require('snipe').preselect_by_classifier('#')
    return snipe.setup(opts)
  end,
}
