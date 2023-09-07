-- Quickstart configs for Nvim LSP
return {
  'neovim/nvim-lspconfig',
  cmd = { 'LspLog', 'LspInfo' },
  config = function ()
    -- Add server configs here
    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  end,
}
