-- Bootstrap Lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- init.lua (Main Entry Point)
require("settings")   -- Basic Neovim settings
require("keymaps")    -- Keybindings
-- require("plugins")    -- Plugin management with lazy.nvim
-- require("lsp")        -- LSP and autocompletion
-- require("dap")        -- Debugging setup
-- require("arduino")    -- Arduino-specific config
-- require("terminal")   -- Terminal integration
-- require("theme")      -- Gruvbox and dashboard styling
-- require("dashboard")  -- Dashboard setup
-- require("markdown")   -- Markdown enhancements
-- require("git")        -- Git integration

-- vim.cmd([[ colorscheme gruvbox ]])

-- ✅ Move Dashboard Setup Here Instead of `dashboard.lua`
local ok, dashboard = pcall(require, "dashboard")
if ok then
    dashboard.setup({
        config = {
            header_pad = 2,
            center_pad = 3,
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
end

-- ✅ Make background transparent
vim.cmd([[
    hi Normal guibg=NONE ctermbg=NONE
    hi NormalNC guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
]])

-- ✅ Ensure Lualine shows up on the dashboard
vim.defer_fn(function()
    require("lualine").setup({
        options = { theme = "gruvbox" }
    })
end, 100)