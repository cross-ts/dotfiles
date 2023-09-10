-- a lua powered greeter like vim-startify/dashboard-nvim
return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VimEnter',
  config = function ()
    require('alpha').setup(
      require('alpha.themes.dashboard').config
    )
  end
}
