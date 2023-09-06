require('lazy').setup({
  -- Neovim plugin for GitHub Copilot
  {'github/copilot.vim'},

  -- The best flat theme for Vim, Atom, Sublime Text, Jetbrains Editors, Terminal.app, iTerm, Xcode, Windows Terminal and XTerm
  {
    'raphamorim/lucario',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme lucario]])
    end,
  },

  -- 💤 A modern plugin manager for Neovim
  {'folke/lazy.nvim'},
}) 
