return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-tree/nvim-web-devicons',
  },
  cmd = { 'Telescope' },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>',  desc = 'Fuzzy find files in cwd' },
    { '<leader>fr', '<cmd>Telescope oldfiles<cr>',    desc = 'Fuzzy find recent files' },
    { '<leader>fs', '<cmd>Telescope live_grep<cr>',   desc = 'Find string in cwd' },
    { '<leader>fc', '<cmd>Telescope grep_string<cr>', desc = 'Find string under cursor in cwd' },
    { '<C-p>',      '<cmd>Telescope find_files<cr>',  desc = 'Find Files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>',   desc = 'Live Grep' },
    { '<leader><leader>', '<cmd>Telescope buffers<cr>', desc = 'Telescope buffers' },
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'

    telescope.setup {
      defaults = {
        path_display = { 'smart' },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    }

    telescope.load_extension 'fzf'

    local present, wk = pcall(require, 'which-key')
    if present then
      wk.add {
        { '<leader>f', group = 'Telescope' },
      }
    end
  end,
}
