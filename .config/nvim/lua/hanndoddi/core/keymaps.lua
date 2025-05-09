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
vim.keymap.set('n', '<leader>æ', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal', })

-- moving lines up and down using alt + j and k
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==') -- move line up(n)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==') -- move line down(n)
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv") -- move line down(v)

keymap.set("n", "<leader>ipi", "<cmd>Pioinit<CR>", { desc = "PIO Init" })
keymap.set("n", "<leader>ipb", "<cmd>Piorun<CR>", { desc = "PIO Build" })
keymap.set("n", "<leader>ipl", "<cmd>Piolib<CR>", { desc = "PIO Library" })
keymap.set("n", "<leader>ipc", "<cmd>Piocmd<CR>", { desc = "PIO Command" })
keymap.set("n", "<leader>ipm", "<cmd>Piomon<CR>", { desc = "PIO Serial Monitor" })
keymap.set("n", "<leader>ipd", "<cmd>Piodebug<CR>", { desc = "PIO Debug" })


-- Don't yank when deleting
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("n", "dd", '"_dd')
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "d", '"_d')


-- buffer

-- Buffers
vim.keymap.set('n', '<leader>9', ':bnext<CR>', { silent = true, desc = "Next Buffer" })
vim.keymap.set('n', '<leader>8', ':bprevious<CR>', { silent = true, desc = "Previous Buffer" })
vim.keymap.set('n', '<leader>0', '<C-^>', { silent = true, desc = "Last Buffer" })


-- Toggle spell checking manually
vim.keymap.set('n', '<leader>cs', ':set spell!<CR>', { noremap = true, silent = true, desc = "Toggle Spell Checking" })

-- Remap [s and ]s for easier spelling error navigation
vim.keymap.set('n', '<leader>7', ']s', { noremap = true, silent = true, desc = "Next Spelling Error" })
vim.keymap.set('n', '<leader>6', '[s', { noremap = true, silent = true, desc = "Previous Spelling Error" })







  
 


