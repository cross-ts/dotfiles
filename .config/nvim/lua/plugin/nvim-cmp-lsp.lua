-- nvim-cmp source for neovim builtin LSP client
return {
  'hrsh7th/cmp-nvim-lsp',
  event = { 'BufReadPre', 'BufNewFile' },
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

    -- Setup LSP
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local lspconfig = require('lspconfig')
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
    })
  end,
}
