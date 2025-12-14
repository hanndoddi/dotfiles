
return {
  'ggandor/leap.nvim',
  event = 'VeryLazy',
  config = function()
    local leap = require('leap')

    -- OPTIONAL but recommended (preview filter for cleaner UX)
    leap.opts.preview = true

    -- Recommended default mappings:
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
  end,
}



