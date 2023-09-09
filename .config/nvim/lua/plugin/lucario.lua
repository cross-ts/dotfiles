-- The best flat theme for Vim, Atom, Sublime Text, Jetbrains Editors, Terminal.app, iTerm, Xcode, Windows Terminal and XTerm
return {
  'raphamorim/lucario',
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd.colorscheme('lucario')
  end,
}
