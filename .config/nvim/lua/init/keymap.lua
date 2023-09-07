-- Keymap Settings
--- Normal Mode
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'y$', 'Y', { noremap = true })

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<up>', 'gk', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-w>h', 'sh', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w>j', 'sj', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w>k', 'sk', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w>l', 'sl', { noremap = true })

--- Insert Mode
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = true })

--- Terminal Mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
