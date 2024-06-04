-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
return {
  'williamboman/mason-lspconfig.nvim',
  cmd = { 'LspInstall', 'LspUninstall' },
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = true,
}
