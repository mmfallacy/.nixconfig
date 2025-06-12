local utils = require('custom.utils')

local supported_ft = {
  'markdown',
  -- Handle avante-nvim files
  'Avante',
}

local M = utils.map_ft('markdown')({
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      file_types = supported_ft,
    },
    ft = supported_ft,
  },
})

--- live-preview.nvim will be mostly used for markdown previews
--- but to account for its HTML, AsciiDoc, SVG support, we also
--- include it in the ft field

M[#M + 1] = {
  'brianhuster/live-preview.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  ft = { 'markdown', 'html', 'asciidoc', 'svg' },
  config = function(_, opts)
    require('livepreview.config').set(opts)
  end,
  opts = {
    -- Do not open a browser by default
    -- browser = nil,
  },
}

return M
