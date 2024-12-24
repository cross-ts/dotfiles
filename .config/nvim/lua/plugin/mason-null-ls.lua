-- mason-null-ls bridges mason.nvim with the null-ls plugin - making it easier to use both plugins together.
return {
  'jay-babu/mason-null-ls.nvim',
  dependencies = {
    'nvimtools/none-ls.nvim',
    'williamboman/mason.nvim',
  },
  cmd = {
    'NoneLsInstall',
    'NoneLsUninstall',
  },
  event = {
    'BufNewFile',
    'BufReadPre',
  },
  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    require('null-ls').setup()
    require('mason-null-ls').setup({
      handlers = {},
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.formatting_sync()
            end,
          })
        end
      end,
    })
  end,
}
