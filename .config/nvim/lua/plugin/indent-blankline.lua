-- Indent guides for Neovim
return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = { 'BufReadPre', 'BufNewFile' },
  init = function()
    vim.opt.list = true
    vim.opt.listchars:append "space:⋅"
    vim.opt.listchars:append "eol:↴"
  end,
}
