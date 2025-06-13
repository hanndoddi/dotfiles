
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      --  enable highlighting
      highlight = {
        enable = true,
      },
      --  enable autotag
      autotag = {
        enable = true,
      },
      --  enable indentation
      indent = {
        enable = true,
      },
      --  languages to install
      ensure_installed = {
        "json", "javascript", "typescript", "tsx", "yaml", "html", "css", "prisma",
        "python", "markdown", "markdown_inline", "svelte", "graphql", "bash",
        "lua", "vim", "dockerfile", "gitignore", "query", "vimdoc", "c", "cpp",
      },
      --  selection capabilities
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}

