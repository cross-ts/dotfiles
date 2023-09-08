-- nvim-cmp source for neovim builtin LSP client
return {
  'hrsh7th/cmp-nvim-lsp',
  event = {'InsertEnter'},
  dependencies = {
    'hrsh7th/nvim-cmp',
    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    -- Setup nvim-cmp
    require('cmp').setup({
      sources = {
        { name = 'nvim_lsp' },
      },
    })

    -- Setup lspconfig
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup({
          capabilities = capabilities,
        })
      end,
    })
  end,
}
