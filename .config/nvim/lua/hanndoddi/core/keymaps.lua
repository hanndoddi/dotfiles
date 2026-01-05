vim.g.mapleader = ' '

local keymap = vim.keymap -- for conciseness

keymap.set('i', 'ææ', '<ESC>', { desc = 'Exit insert mode with jj' })
keymap.set('n', 'ææ', '<ESC>', { desc = 'Exit insert mode with jj' })
keymap.set('v', 'ææ', '<ESC>', { desc = 'Exit insert mode with jj' })

keymap.set('n', '<leader>n', ':nohl<CR>', { desc = 'Clear search highlights' })

keymap.set('n', '<leader>1', '<cmd>Dashboard<CR>', { desc = 'Dashboard' })

-- increment/decrement numbers
-- keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
-- keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

-- terminal
vim.keymap.set('n', '<leader>æ', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })

-- moving lines up and down using alt + j and k
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==') -- move line up(n)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==') -- move line down(n)
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv") -- move line down(v)

keymap.set('n', '<leader>ipi', '<cmd>Pioinit<CR>', { desc = 'PIO Init' })
keymap.set('n', '<leader>ipb', '<cmd>Piorun<CR>', { desc = 'PIO Build' })
keymap.set('n', '<leader>ipl', '<cmd>Piolib<CR>', { desc = 'PIO Library' })
keymap.set('n', '<leader>ipc', '<cmd>Piocmd<CR>', { desc = 'PIO Command' })
keymap.set('n', '<leader>ipm', '<cmd>Piomon<CR>', { desc = 'PIO Serial Monitor' })
keymap.set('n', '<leader>ipd', '<cmd>Piodebug<CR>', { desc = 'PIO Debug' })

-- Don't yank when deleting
vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('n', 'dd', '"_dd')
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('v', 'd', '"_d')

-- buffer

-- Buffers
vim.keymap.set('n', '<leader>9', ':bnext<CR>', { silent = true, desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>8', ':bprevious<CR>', { silent = true, desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>0', '<C-^>', { silent = true, desc = 'Last Buffer' })

-- Toggle spell checking manually
vim.keymap.set('n', '<leader>cs', ':set spell!<CR>', { noremap = true, silent = true, desc = 'Toggle Spell Checking' })

-- Remap [s and ]s for easier spelling error navigation
vim.keymap.set('n', '<leader>7', ']s', { noremap = true, silent = true, desc = 'Next Spelling Error' })
vim.keymap.set('n', '<leader>6', '[s', { noremap = true, silent = true, desc = 'Previous Spelling Error' })

vim.keymap.set('n', '<leader>icr', function()
  vim.cmd 'split | terminal ./main'
end, { desc = 'Run C binary in terminal split' })

vim.keymap.set('n', '<leader>icc', function()
  vim.cmd '!gcc % -o main'
end, { desc = 'Compile C file' })

vim.keymap.set('n', '<leader>icx', function()
  vim.cmd "!gcc % -o main && echo 'Compiled.'"
  vim.cmd 'split | terminal ./main'
end, { desc = 'Compile and run C in terminal split' })

vim.keymap.set('n', '<leader>id', function()
  local util = require 'plenary.path'
  local cwd = vim.fn.getcwd()
  local root = cwd

  -- Find directory that contains mkdocs.yml
  while root ~= '/' do
    if util.new(root .. '/mkdocs.yml'):exists() then
      break
    end
    root = util.new(root):parent().filename
  end

  if root == '/' then
    vim.notify('mkdocs.yml not found in parent directories', vim.log.levels.ERROR)
    return
  end

  local Terminal = require('toggleterm.terminal').Terminal
  Terminal:new({
    cmd = 'cd ' .. root .. ' && source .venv/bin/activate && mkdocs serve',
    -- hidden = true,
    -- direction = "float",
    close_on_exit = false,
  }):toggle()
end, { desc = 'Serve MkDocs from root' })

-- Toggle diagnostics
local diagnostics_enabled = true
vim.keymap.set('n', '<leader>t', function()
  diagnostics_enabled = not diagnostics_enabled
  if diagnostics_enabled then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
  print('Diagnostics ' .. (diagnostics_enabled and 'enabled' or 'disabled'))
end, { desc = 'Toggle diagnostics', silent = true })

-- toggle indent on and off


 
vim.keymap.set("n", "<leader>ui", function()
  local ok, snacks = pcall(require, "snacks")
  if not ok then
    vim.notify("Snacks not loaded", vim.log.levels.WARN)
    return
  end
  local i = snacks.indent
  i.enabled = not i.enabled
  if i.enabled then
    i.enable()
    vim.notify("Snacks indent: ON", vim.log.levels.INFO)
  else
    i.disable()
    vim.notify("Snacks indent: OFF", vim.log.levels.INFO)
  end
end, { desc = "Toggle Snacks Indent" })



