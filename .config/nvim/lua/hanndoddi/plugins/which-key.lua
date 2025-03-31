return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    vim.cmd [[
        highlight WhichKeyGroup     guifg=#ffaa00 guibg=NONE
        ]],
  },
  {
    'echasnovski/mini.icons', -- Add this line to install mini.icons
  },
}

--{
--  "folke/which-key.nvim",
--  opts = function(_, opts)
--    local icons = require("mini.icons")
--    opts.icons = {
--      breadcrumb = icons.ui.ChevronRight,
--      separator = icons.ui.ChevronRight,
--      group = icons.ui.Circle,
--    }
--    return opts
--  end,
--}

-- highlight WhichKeyDesc      guifg=#6A7DE9 guibg=NONE
--   highlight WhichKey          guifg=#00ff00 guibg=NONE

