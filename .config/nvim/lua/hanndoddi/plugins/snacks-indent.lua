
return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      animate = {
        enabled = false,
      },
    },
  },
  keys = {
    {
      "<leader>ui",
      function()
        local snacks = require("snacks")
        snacks.indent.enabled = not snacks.indent.enabled
        if snacks.indent.enabled then
          snacks.indent.enable()
          vim.notify("Snacks indent: ON", vim.log.levels.INFO)
        else
          snacks.indent.disable()
          vim.notify("Snacks indent: OFF", vim.log.levels.INFO)
        end
      end,
      desc = "Toggle Snacks Indent",
    },
  },
}

