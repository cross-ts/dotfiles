-- Nvim Treesitter configurations and abstraction layer
return {
  'nvim-treesitter/nvim-treesitter',
  cmd = { 'TSUpdate' },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash',
        'go',
        'json',
        'lua',
        'php',
        'python',
        'ruby',
        'svelte',
        'terraform',
        'typescript',
        'toml',
        'yaml',
      },
    })
  end
}
