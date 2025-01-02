-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'hrsh7th/cmp-nvim-lsp',
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
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local default_capabilities = cmp_nvim_lsp.default_capabilities()
        require('lspconfig')[server_name].setup({
          capabilities = default_capabilities,
        })
      end,
    })
  end
}
