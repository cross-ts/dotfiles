-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
return {
  'williamboman/mason-lspconfig.nvim',
  cmd = { 'LspInstall', 'LspUninstall' },
  dependencies = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    require('mason_lspconfig').setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup({})
      end,
    })
  end,
}
