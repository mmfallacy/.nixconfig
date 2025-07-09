local utils = require('custom.utils')

local M = utils.map_ft('markdown')({
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      -- Issue: URLs are hidden in links when in insert mode! Manually adding insert and visual solves this.
      render_modes = { 'n', 'c', 't', 'i', 'v' },
    },
    ft = { 'markdown', 'Avante' },

    config = function(_, opts)
      -- Enable blink integration if blink is used.
      -- NOTE: When opts.completions.blink.enabled is true, nvim-cmp source integrations is not available.
      local has_blink, blink = pcall(require, 'blink.cmp')
      if has_blink then
        opts.completions = { blink = { enabled = true } }
      end

      require('render-markdown').setup(opts)

      -- Set up render-markdown as completion source
      local has_cmp, cmp = pcall(require, 'cmp')
      if has_cmp then
        local sources = cmp.get_config().sources
        -- Add render-markdown as source for nvim-cmp
        sources[#sources + 1] = { name = 'render-markdown', group_index = 1 }
        cmp.setup.filetype('markdown', {
          sources = sources,
        })
      end
    end,
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
