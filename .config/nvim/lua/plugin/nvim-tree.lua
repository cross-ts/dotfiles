-- A file explorer tree for neovim written in lua
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  cmd = { 'NvimTreeOpen', 'NvimTreeToggle' },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.api.nvim_set_keymap('n', '<leader>fi', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
  end,
  config = function()
    require('nvim-tree').setup({
      renderer = {
        indent_markers = {
          enable = true,
        }
      },
    })

    -- AutoClose
    -- See: https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
    local group = 'NvimTreeAutoClose'
    vim.api.nvim_create_augroup(group, {clear = true})
    vim.api.nvim_create_autocmd('QuitPre', {
      group = group,
      callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match('NvimTree_') ~= nil then
            table.insert(tree_wins, w)
          end
          if vim.api.nvim_win_get_config(w).relative ~= '' then
            table.insert(floating_wins, w)
          end
        end
        if 1 == #wins - #floating_wins - #tree_wins then
          -- Should quit, so we close all invalid windows.
          for _, w in ipairs(tree_wins) do
            vim.api.nvim_win_close(w, true)
          end
        end
      end
    })
  end
}
