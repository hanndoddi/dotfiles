return {
  'folke/zen-mode.nvim',
  event = 'VeryLazy',
  opts = {
    window = {
      backdrop = 0.95,
      width = 100,
      options = {
        number = false,
        relativenumber = false,
        signcolumn = 'no',
        foldcolumn = '0',
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
      },
      twilight  = { enabled = false }, -- enable if using twilight.nvim
      gitsigns  = { enabled = false },
      tmux      = { enabled = false },
      kitty     = {
        enabled = true,
        font = '+4',
      },
    },
  },
  keys = {
    { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Toggle Zen Mode' },
  },
}
