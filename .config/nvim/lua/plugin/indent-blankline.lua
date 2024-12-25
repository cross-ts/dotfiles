-- Indent guides for Neovim
return {
  'lukas-reineke/indent-blankline.nvim',
  enabled = false,
  dependencies = {
    'HiPhish/rainbow-delimiters.nvim',
  },
  event = {
    'BufNewFile',
    'BufReadPre',
  },
  main = 'ibl',
  config = function()
    local rainbow = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }
    local hooks = require("ibl.hooks")

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    vim.g.rainbow_delimiters = { highlight = rainbow }

    require("ibl").setup({
      scope = {
        highlight = rainbow,
        show_start = false,
      },
    })
  end,
}
