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

})

-- Configure Lualine
require('lualine').setup({
    options = { theme = 'gruvbox' }
})

-- Enable line numbers
vim.opt.number = true

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












