return {
  'nvimdev/dashboard-nvim',
  event = "VimEnter",
  config = function()
    local db = require 'dashboard'
    db.setup {
      theme = 'hyper',
      config = {
        header_pad = 2,
        center_pad = 3,
        header = {
          '::::::::::::::::::::::::::::::::::::::::::::::::::',
          '::::::::::::::::::::::::::::::::::::::::::::::::::',
          '::::::::::::::::::-==++***+++=--::::::::::::::::::',
          '::::::::::::::-+*%%%%%######%%%%#*=-::::::::::::::',
          ':::::::::::-+#%%#*=-:::::::::--+*%%%*=::::::::::::',
          ':::::::::-*%@#+-::-+**######*+=-::=*%@#=::::::::::',
          '::::::::+%@#=::-+%%#*++++++++*#%#=::-+%@#-::::::::',
          ':::::::*@%+:::+%%+=+*#%%%%%##*==*%#-::-#@%=:::::::',
          '::::::*@%=:::*@*-*%%%%%%%%%%%%%#==%%=:::*@%=::::::',
          ':::::+@%=:::-%*-#@%%%%%%%%%%%%%%@+=%*::::#@%-:::::',
          ':::::#%*:-=++=:*#######%%%%#######=-++==:-%%+:::::',
          ':::::--:=%%%%%--*##%###==-+######+:+@%%%#----:::::',
          '::::=%%=#@%%%%*+%%%%%%#=%*+@%%%%@*++%%%%@+*%#:::::',
          '::::=%@++%%%%**#+####*+%%%**#####+%=#%%%#=#@#:::::',
          ':::::#@#::-=-:=@%#####%%%%%%#####%#:-==-:-%@+:::::',
          ':::::+@%+::::::#@%%%%%%%%%%%%%%%%%=::::::#@#-:::::',
          '::::::*@%=::::::#%%%%%%%%%%%%%%%%+::::::*@%=::::::',
          ':::::::*@%+::::::*%%%%%%%%%%%%%#=:::::-#@%=:::::::',
          '::::::::=%@#=:::::=#%%%%%%%%%%+-::::-+%@*-::::::::',
          ':::::::::-+%@#+-::::-=+****+=:::::=*%@#=::::::::::',
          ':::::::::::-+#%%#*+--::::::::-=+#%%%*=::::::::::::',
          '::::::::::::::-=*#%%%%#####%%%%%#+=-::::::::::::::',
          '::::::::::::::::::--==++++++==-:::::::::::::::::::',
          '::::::::::::::::::::::::::::::::::::::::::::::::::',
          '::::::::::::::::::::::::::::::::::::::::::::::::::',
          ' I USE NEOVIM BTW! ',
        },
        shortcut = {
          { desc = ' GitHub', key = '1', action = 'edit ~/github/' },
          -- { desc = '📂 Files', key = '1', action = 'Telescope find_files' },
          -- { desc = '📜 New File', key = '2', action = 'ene | startinsert' },
          { desc = '󰊪 hanndoddi.com', key = '2', action = 'edit ~/github/hanndoddi_site/' },
          { desc = ' Config', key = '3', action = 'edit ~/.config/nvim/lua/hanndoddi/' },
          { desc = '󰮠 GitLab', key = '4', action = 'edit ~/gitlab/' },
          { desc = '󱃕 FabIsa Masterplan', key = '5', action = 'edit ~/github/master_plan_2025/' },
          { desc = ' Week Plan', key = '6', action = 'edit ~/github/Project_Management_Test/weeks_2025_todo/' },
         -- { desc = '❌ Quit', key = '4', action = 'qa' },
        },
        project = { enable = true, limit = 4, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
        footer = {
          ' ',
          'Welcome to Neovim with DJoddi! 🎧',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
        },
      },
    }
  -- defer plugin loading to improve dashboard load time
vim.api.nvim_create_autocmd("User", {
  pattern = "DashboardReady",
  callback = function()
    require("lazy").load({ wait = false })
  end,
})
  end,
}
