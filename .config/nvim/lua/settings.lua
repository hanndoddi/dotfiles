-- lua/settings.lua (General Neovim Settings)

-- UI Enhancements
vim.opt.number = true               -- Show line numbers
vim.opt.relativenumber = true       -- Relative line numbers
vim.opt.cursorline = true           -- Highlight the current line
vim.opt.termguicolors = true        -- Enable 24-bit colors
vim.opt.scrolloff = 8               -- Keep at least 8 lines visible when scrolling

-- Indentation and Formatting
vim.opt.expandtab = true            -- Use spaces instead of tabs
vim.opt.shiftwidth = 4              -- Indentation amount for < and >
vim.opt.tabstop = 4                 -- Number of spaces per tab
vim.opt.smartindent = true          -- Enable smart indentation

-- Performance
vim.opt.updatetime = 300            -- Faster completion (default: 4000ms)
vim.opt.timeoutlen = 500            -- Reduce key sequence wait time
vim.opt.hidden = true               -- Allow switching buffers without saving

-- Searching
vim.opt.ignorecase = true           -- Ignore case when searching
vim.opt.smartcase = true            -- Case-sensitive search if uppercase is used
vim.opt.incsearch = true            -- Show search results as you type

-- Splitting Behavior
vim.opt.splitbelow = true           -- Open horizontal splits below
vim.opt.splitright = true           -- Open vertical splits to the right

-- Clipboard
vim.opt.clipboard = "unnamedplus"   -- Use system clipboard

-- Undo and Backup
vim.opt.undofile = true             -- Save undo history
vim.opt.backup = false              -- No backup files
vim.opt.swapfile = false            -- No swap files

