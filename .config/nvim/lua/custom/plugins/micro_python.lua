return {
    "jim-at-jibba/micropython.nvim",
    dependencies = { "akinsho/toggleterm.nvim", "stevearc/dressing.nvim" },
    config = function()
        vim.keymap.set("n", "<leader>mr", function()
            require("micropython_nvim").run()
        end, { desc = "Run MicroPython script" })
    end,
}
