-- Find, Filter, Preview, Pick. All lua, all the time.
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3',
  cmd = { 'Telescope' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  keys = {
    { '<leader>ff', function() require('telescope.builtin').find_files() end, { silent = true } },
    {
      '<leader>fg',
      function()
        require('telescope.builtin').grep_string({
          shorten_path = true,
          word_match = "-w",
          only_sort_text = true,
          search = '',
          additional_args = {
            '--hidden',
            '--glob', '!.git/*',
          },
        })
      end,
      { silent = true }
    },
    { '<leader>fb', function() require('telescope.builtin').buffers() end, { silent = true } },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end, { silent = true } },
    { '<leader>fr', function() require('telescope.builtin').oldfiles() end, { silent = true } },
  },
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--hidden', '--follow', '--glob', '!.git/*' },
        }
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        }
      }
    })
    require('telescope').load_extension('fzf')
  end
}