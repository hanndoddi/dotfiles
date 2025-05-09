
return{
  "uga-rosa/ccc.nvim",
  cmd = { "CccPick", "CccHighlighterToggle" },
  keys = {
    { "<leader>cp", "<cmd>CccPick<CR>", desc = "🎨 Pick color" },
    { "<leader>cc", "<cmd>CccHighlighterToggle<CR>", desc = "🎨 Toggle color highlights" },
  },
  config = function()
    require("ccc").setup()
  end,
}
