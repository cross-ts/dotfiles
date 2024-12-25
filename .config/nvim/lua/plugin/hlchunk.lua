-- This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed
return {
  "shellRaining/hlchunk.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  event = {
    "BufNewFile",
    "BufReadPre",
  },
  config = function()
    local hlchunk = require("hlchunk")
    local cursor_color = ("#%06x"):format(vim.api.nvim_get_hl(0, { name = "CursorLineNr" }).fg)
    hlchunk.setup {
      chunk = {
        enable = true,
        use_treesitter = true,
        duration = 100,
        delay = 100,
      },
      indent = {
        enable = true,
      },
      line_num = {
        enable = true,
        style = cursor_color,
        use_treesitter = true,
      },
      blank = {
        enable = true,
      },
    }
  end,
}
