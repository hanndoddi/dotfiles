-- lua/plugins.lua (Lazy.nvim Plugin Management)

require("lazy").setup({

    -- **LSP (Language Server Protocol)**
    { "neovim/nvim-lspconfig", config = function()
        require("lspconfig").clangd.setup({})
        require("lspconfig").cmake.setup({})
      end
    },
  
    -- **Debugging (DAP - Debug Adapter Protocol)**
    { "mfussenegger/nvim-dap", config = function()
        require("dap").adapters.gdb = { type = "executable", command = "gdb-multiarch", args = { "-q" } }
      end
    },
  
    -- **Terminal Integration**
    { "akinsho/toggleterm.nvim", config = function()
        require("toggleterm").setup { open_mapping = [[<C-t>]], direction = "float" }
      end
    },
  
    -- **UI Enhancements**
    { 
        "nvimdev/dashboard-nvim", 
        config = function()
          require("dashboard").setup({
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
      },
      
      
  
    -- **Markdown Support**
    { "iamcco/markdown-preview.nvim", build = "cd app && npm install", ft = "markdown", cmd = "MarkdownPreviewToggle" },
    { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
    { "dhruvasagar/vim-table-mode", cmd = "TableModeToggle" },
  
    -- **Git Integration**
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end },
    { "sindrets/diffview.nvim" }
  
  })
  