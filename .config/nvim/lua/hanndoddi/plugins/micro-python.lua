return {
  "jim-at-jibba/micropython.nvim",
  cmd = "MP",
  keys = {
    { "<leader>imr", function() require("micropython_nvim").run() end, desc = "Run MicroPython script" },
  },
  config = function()
    require("micropython_nvim").setup()
  end,
}
