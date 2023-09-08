-- nvim-cmp source for neovim builtin LSP client
return {
  'hrsh7th/cmp-nvim-lsp',
  event = {'InsertEnter'},
  dependencies = {
    'hrsh7th/nvim-cmp',
    'neovim/nvim-lspconfig',
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

    -- TODO: Add more language servers and use mason-lspconfig setup_handler
    require('lspconfig').pyright.setup({
      capabilities = capabilities,
    })
  end,
}
