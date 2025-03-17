-- Bootstrap Lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load Lazy.nvim and add plugins
require("lazy").setup({
    -- Better syntax highlighting
    "nvim-treesitter/nvim-treesitter",

    -- Status line
    "nvim-lualine/lualine.nvim",

    -- File explorer
    "nvim-tree/nvim-tree.lua",

    -- Fuzzy finder (Ctrl + P alternative)
    "nvim-telescope/telescope.nvim",

    -- Dashboard for fancy start screen
    "nvimdev/dashboard-nvim",

    --theme
    "ellisonleao/gruvbox.nvim",

    {
        "plasticboy/vim-markdown",
        dependencies = { "godlygeek/tabular" }, -- Required for table formatting
        config = function()
            vim.g.vim_markdown_conceal = 1  -- Hide formatting markers
            vim.g.vim_markdown_folding_disabled = 1  -- Prevent annoying auto-folding
            vim.g.vim_markdown_new_list_item_indent = 0
            vim.g.vim_markdown_strikethrough = 1
            vim.g.vim_markdown_math = 1
            vim.g.vim_markdown_auto_insert_bullets = 1
            vim.g.vim_markdown_no_extensions_in_markdown = 1
            vim.g.vim_markdown_toc_autofit = 1 -- Automatically resize TOC
            vim.g.vim_markdown_task_lists = 1 -- Enable task list support
            
        end
    }
    
})

-- Configure Lualine
require('lualine').setup({
    options = { theme = 'gruvbox' }
})

-- Enable line numbers
vim.opt.number = true          -- Enable absolute line number for the current line
vim.opt.relativenumber = true  -- Enable relative line numbers for other lines


-- Configure Dashboard
local db = require('dashboard') 
db.setup({
    theme = 'hyper',
    config = {
        header_pad = 2,   -- Adjust top padding of header
        center_pad = 3,   -- Adjust centering of content
        header = {
            "::::::::::::::::::::::::::::::::::::::::::::::::::",
            "::::::::::::::::::::::::::::::::::::::::::::::::::",
            "::::::::::::::::::-==++***+++=--::::::::::::::::::",
            "::::::::::::::-+*%%%%%######%%%%#*=-::::::::::::::",
            ":::::::::::-+#%%#*=-:::::::::--+*%%%*=::::::::::::",
            ":::::::::-*%@#+-::-+**######*+=-::=*%@#=::::::::::",
            "::::::::+%@#=::-+%%#*++++++++*#%#=::-+%@#-::::::::",
            ":::::::*@%+:::+%%+=+*#%%%%%##*==*%#-::-#@%=:::::::",
            "::::::*@%=:::*@*-*%%%%%%%%%%%%%#==%%=:::*@%=::::::",
            ":::::+@%=:::-%*-#@%%%%%%%%%%%%%%@+=%*::::#@%-:::::",
            ":::::#%*:-=++=:*#######%%%%#######=-++==:-%%+:::::",
            ":::::--:=%%%%%--*##%###==-+######+:+@%%%#----:::::",
            "::::=%%=#@%%%%*+%%%%%%#=%*+@%%%%@*++%%%%@+*%#:::::",
            "::::=%@++%%%%**#+####*+%%%**#####+%=#%%%#=#@#:::::",
            ":::::#@#::-=-:=@%#####%%%%%%#####%#:-==-:-%@+:::::",
            ":::::+@%+::::::#@%%%%%%%%%%%%%%%%%=::::::#@#-:::::",
            "::::::*@%=::::::#%%%%%%%%%%%%%%%%+::::::*@%=::::::",
            ":::::::*@%+::::::*%%%%%%%%%%%%%#=:::::-#@%=:::::::",
            "::::::::=%@#=:::::=#%%%%%%%%%%+-::::-+%@*-::::::::",
            ":::::::::-+%@#+-::::-=+****+=:::::=*%@#=::::::::::",
            ":::::::::::-+#%%#*+--::::::::-=+#%%%*=::::::::::::",
            "::::::::::::::-=*#%%%%#####%%%%%#+=-::::::::::::::",
            "::::::::::::::::::--==++++++==-:::::::::::::::::::",
            "::::::::::::::::::::::::::::::::::::::::::::::::::",
            "::::::::::::::::::::::::::::::::::::::::::::::::::",
        },
        shortcut = {
            { desc = '📂 Files', key = '1', action = 'Telescope find_files' },
            { desc = '📜 New File', key = '2', action = 'ene | startinsert' },
            { desc = '🛠️ Config', key = '3', action = 'edit ~/.config/nvim/init.lua' },
            { desc = '❌ Quit', key = '4', action = 'qa' },
        },
        footer = { 'Welcome to Neovim with DJoddi! 🎧' },
    }
})
vim.cmd([[
    colorscheme gruvbox

    " ✅ Make background transparent
    hi Normal guibg=NONE ctermbg=NONE
    hi NormalNC guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
]])


    -- hi DashboardHeader guifg=#ffb700  " ✅ Gruvbox Orange (Fix color override)

vim.defer_fn(function()
    require("lualine").setup({
        options = { theme = "gruvbox" }
    })
end, 100)


-- disable pearl rugby

vim.g.loaded_perl_provider = 0






 
