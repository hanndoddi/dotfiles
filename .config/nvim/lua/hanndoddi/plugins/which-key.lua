
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,

opts = {
  plugins = {
    spelling = true,
  },
  filters = {
    ignore_missing = true,
  },
  triggers_blacklist = {
    n = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" },
  },
},
  config = function()
    vim.cmd [[
      highlight WhichKeyGroup guifg=#ffaa00 guibg=NONE
    ]]

    local present, wk = pcall(require, "which-key")
    if present then
      wk.add {
        { "<leader>c", group = 'Code Action' },
        { "<leader>h", group = 'Git' },
        { "<leader>n", group = 'Clear Search Highlight' },
        { '<leader>o', group = 'Org', icon = ""},
        { "<leader>r", group = 'LSP', icon = "" },
        { "<leader>w", group = 'Session' },
        { '<leader>i', group = 'Embedded', icon = ""},
        { '<leader>ip', group = 'PlatformIO', icon = ""},
        { '<leader>s', group = 'Splits', icon = ""},
        { "<leader>z", name = 'Relax!' },
        { "<leader>1", hidden = true},
        { "<leader>2", hidden = true},
        { "<leader>3", hidden = true},
        { "<leader>4", hidden = true},
        { "<leader>5", hidden = true},
        { "<leader>6", hidden = true},
        { "<leader>7", hidden = true},
        { "<leader>8", hidden = true},
        { "<leader>9", hidden = true},
        { "<leader>0", hidden = true},
        { "<leader>b", group = "buffers", expand = function()
        return require("which-key.extras").expand.buf()
        end
        },
      }
    end
  end,
  dependencies = {
    { 'echasnovski/mini.icons', lazy = true },
  }
}
