return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      -- Optional: enable helpful default UIs
      long_message_to_split = true,
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function(_, opts)
    -- Setup notify with a background color
    require("notify").setup({
      background_colour = "#000000",
      merge_duplicates = true, -- resolves the warning about missing field
    })

    -- Setup noice with options
    require("noice").setup(opts)

    vim.keymap.set("n", "<leader>fn", "<cmd>Telescope notify<CR>", { desc = "Telescope Notify" })
  end,
}
