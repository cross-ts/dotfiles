-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
  },
  cmd = {
    'LspInstall',
    'LspUninstall',
  },
  event = {
    'BufNewFile',
    'BufReadPre',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup()

    require('mason-lspconfig').setup_handlers({
      function (server_name)
        require('lspconfig')[server_name].setup({})
      end,
    })
  end
}
