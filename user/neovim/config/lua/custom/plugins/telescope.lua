local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-fzf-native.nvim"
  }
}

local DOTFILES_PATH = vim.env.DOTFILES_PATH or (vim.env.HOME .. '.dotfiles')

function M.config()
    require("telescope").setup {
        defaults = {
            path_display = { 'filename_first' , 'truncate' },
            -- Use ripgrep
            vimgrep_arguments = {
              'rg',
              '--color=never',  -- Suppress color output
              '--no-heading',
              '--with-filename', -- required
              '--line-number', -- required
              '--column', -- required
              '--smart-case',
              '--trim', -- Remove the whitespaces at the start of every line match
            },
            mappings = {
              i = {
                -- Since telescope starts in Insert mode, you normally need to press Esc twice to close.
                -- Closes telescope on one escape keypress.
                [ '<Esc>' ] = require('telescope.actions').close
              }
            }
        },
        pickers = {
          find_files = {
            -- Use fd for finding files
            -- --strip-cwd-prefix so all paths are relative to neovim's cwd.
            find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix'}
          }
        },
    }
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")
end

M.keys = {

    {
        "<leader>fg",
        function()
            require("telescope.builtin").git_files()
        end,
    },
    {
        "<leader>fr",
        function()
            require("telescope.builtin").live_grep()
        end,
    },
    {
        "<leader>fp",
        function()
            require("telescope.builtin").find_files()
        end,
    },
    {
        "<leader>f,",
        function()
            require("telescope.builtin").find_files { cwd = DOTFILES_PATH  }
        end,
    },
    {
        "<leader>ft",
        function()
            require("telescope.builtin").treesitter()
        end,
    },
    {
        "<leader>fb",
        function()
            require("telescope.builtin").buffers()
        end,
    },
    { "<leader>fc", "<CMD>TodoTelescope<CR>" },
}

return M
