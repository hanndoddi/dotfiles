return {
  "jim-at-jibba/micropython.nvim",
  dependencies = { "akinsho/toggleterm.nvim", "stevearc/dressing.nvim" },
  cmd = { "MicropythonRun", "MicropythonConnect" },
  keys = {
    { "<leader>imr", function() require("micropython_nvim").run() end, desc = "Run MicroPython script" },
  },
  config = function()
    vim.keymap.set("n", "<leader>imr", function()
      require("micropython_nvim").run()
    end, { desc = "Run MicroPython script" })
  end,
}
