-- Indent guides for Neovim
return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  init = function()
    vim.opt.list = true
    vim.opt.listchars:append "space:⋅"
    vim.opt.listchars:append "eol:↴"
  end,
  opts = {
    show_end_of_line = true,
    space_char_blankline = ' ',
  }
}
