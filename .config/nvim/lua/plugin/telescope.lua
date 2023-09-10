-- Find, Filter, Preview, Pick. All lua, all the time.
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3',
  cmd = { 'Telescope' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  init = function()
    vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true })
  end,
  config = function()
    local actions = require("telescope.actions")
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '--glob', '!.git',
          '--trim',
        },
      },
      pickers = {
        find_files = {
          find_command = {
            'rg',
            '--files',
            '--hidden',
            '--glob', '!.git',
          },
        },
      },
    })
  end
}
