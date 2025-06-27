local M = {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',

    -- File selector picker
    'nvim-telescope/telescope.nvim',
    -- Rendering Avante Files
    'MeanderingProgrammer/render-markdown.nvim',
    -- TODO: Image pasting dependency
  },
}

function has_missing_key(provider)
  if provider == 'claude' and vim.env.ANTHROPIC_API_KEY ~= nil then
    return false
  end
  if provider == 'openai' and vim.env.OPENAI_API_KEY ~= nil then
    return false
  end
  if provider == 'gemini' and vim.env.GEMINI_API_KEY ~= nil then
    return false
  end

  return true
end

function M.config(_, opts)
  -- ENV KEY checking prior to staring avante
  if has_missing_key(opts.provider) then
    return vim.notify(
      [[avante.nvim cannot find your API key for "]] .. opts.provider .. [[" provider!]],
      vim.log.levels.ERROR
    )
  else
    require('avante').setup(opts)
  end
end

M.opts = {
  provider = 'gemini',
}

return M
