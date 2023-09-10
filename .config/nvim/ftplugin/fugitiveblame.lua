-- quit buffer with q
vim.api.nvim_buf_set_keymap(0, 'n', 'q', ':q<CR>', { silent = true })
