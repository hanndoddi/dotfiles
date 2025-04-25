return {
  'folke/zen-mode.nvim',
  opts = {

    on_open = function()
      print 'Zen Mode opened'
      print('TERM:', vim.env.TERM)
      print('KITTY_LISTEN_ON:', vim.env.KITTY_LISTEN_ON)
    end,
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
      twilight = { enabled = false }, -- set to true if using twilight.nvim
      gitsigns = { enabled = false },
      tmux = { enabled = false },
    },
    kitty = {
      enabled = true, -- this is key!
      font = '+9', -- increase font size
    },
  },
  keys = {
    { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Toggle Zen Mode' },
  },
}
