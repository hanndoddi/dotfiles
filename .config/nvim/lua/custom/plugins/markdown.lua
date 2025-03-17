return {
    {
        "preservim/vim-markdown",
        dependencies = { "godlygeek/tabular" },
        config = function()
            vim.g.vim_markdown_task_lists = 1
            vim.g.vim_markdown_auto_insert_bullets = 1
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_strikethrough = 1
            vim.g.vim_markdown_math = 1
            vim.g.vim_markdown_toc_autofit = 1
        end
    }
    
}
