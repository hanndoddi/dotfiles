vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "org", "text" },
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "i", "<C-x>",
            [[<Esc><leader>x a]],
            { noremap = true, silent = true })
    end,
})
