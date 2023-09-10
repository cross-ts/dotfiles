-- A snazzy bufferline for Neovim
return {
  'akinsho/bufferline.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = true,
}
