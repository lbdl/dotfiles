-- a trial at setting  custom status for the ntree window, kinda
-- borked though as it seems to set this for ALL buffers
vim.api.nvim_create_autocmd({"BufNew", "BufAdd", "BufRead"}, {
  pattern = {"*"},
  callback = function(ev)
      ty = vim.fn.bufname()
      if string.find(ty, 'ntree_buff') then
        print('Found a ntree buff: ', ty)
        vim.o.statusline = 'Explorer'
      end
  end
})
