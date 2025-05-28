vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local bufname = vim.api.nvim_buf_get_name(args.buf)
    if bufname ~= '' and vim.fn.filereadable(bufname) == 1 then
      local dir = vim.fn.fnamemodify(bufname, ':p:h')
      vim.cmd('cd ' .. dir)
    end
  end,
  once = true,
})

