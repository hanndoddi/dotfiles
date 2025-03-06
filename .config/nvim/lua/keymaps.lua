-- lua/keymaps.lua (Custom Keybindings)

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader Key
vim.g.mapleader = " "  -- Spacebar as leader key

-- File Operations
map("n", "<leader>w", ":w<CR>", opts)            -- Save file
map("n", "<leader>q", ":q<CR>", opts)            -- Quit file
map("n", "<leader>x", ":x<CR>", opts)            -- Save and quit

-- Navigation
map("n", "<C-h>", "<C-w>h", opts)                -- Move to left window
map("n", "<C-l>", "<C-w>l", opts)                -- Move to right window
map("n", "<C-j>", "<C-w>j", opts)                -- Move to bottom window
map("n", "<C-k>", "<C-w>k", opts)                -- Move to top window

-- Terminal Mode Escape
map("t", "<Esc>", "<C-\\><C-n>", opts)           -- Exit terminal mode with Esc

-- Search Improvements
map("n", "<leader>n", ":noh<CR>", opts)          -- Clear search highlights

-- Plugin-Specific Keybindings

-- **Arduino CLI**
map("n", "<leader>am", ":!arduino-cli monitor -p /dev/ttyUSB0 -b 115200<CR>", opts) -- Monitor Serial
map("n", "<leader>ac", ":!arduino-cli compile --fqbn arduino:avr:uno<CR>", opts)   -- Compile Sketch
map("n", "<leader>au", ":!arduino-cli upload -p /dev/ttyUSB0 --fqbn arduino:avr:uno<CR>", opts) -- Upload Sketch

-- **ToggleTerm**
map("n", "<C-t>", ":ToggleTerm<CR>", opts)      -- Open/close terminal

-- **Markdown**
map("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", opts) -- Toggle Markdown Preview
map("n", "<leader>mg", ":Glow<CR>", opts)                  -- Use Glow for Markdown Preview

-- **Git**
map("n", "<leader>gs", ":G<CR>", opts)          -- Open Git status (Fugitive)
map("n", "<leader>gd", ":DiffviewOpen<CR>", opts) -- Open Git Diff

-- **Telescope (Fuzzy Finder)**
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)  -- Find files
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)   -- Live grep

