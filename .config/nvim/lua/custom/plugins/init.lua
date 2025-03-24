-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local db = require('lualine').setup({
        options = { theme = 'gruvbox' },
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    })
end,
}
