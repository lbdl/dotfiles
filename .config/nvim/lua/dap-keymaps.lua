
-- dap-keymaps.lua
local M = {}

function M.setup()
  local dap = require('dap')
  local dapui = require('dapui')

  local map = vim.keymap.set

  map('n', '<localleader><F2>', function()
    dap.continue()
    dapui.open()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>=', true, true, true), 'n', false)
  end)

  map('n', '<localleader>dt', dapui.toggle)
  map('n', '<localleader>dl', require('dap.ui.widgets').hover)
  map('n', '<localleader><F5>', dap.continue)
  map('n', '<localleader><F3>', dap.toggle_breakpoint)
  map('n', '<localleader><F6>', dap.step_over)
  map('n', '<localleader><F7>', dap.step_into)
  map('n', '<localleader><F8>', dap.step_out)
  map('n', '<localleader><F9>', dapui.toggle)
  map('n', '<localleader><F12>', dap.terminate)

  map('n', '<localleader><F11>', function()
    dap.clear_breakpoints()
    vim.notify('Breakpoints cleared', vim.log.levels.WARN)
  end)

  map('n', '<localleader><F10>', function()
    dap.clear_breakpoints()
    dap.terminate()
    dapui.close()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>=', true, true, true), 'n', false)
    vim.notify('Debugger session ended', vim.log.levels.WARN)
  end)
end

return M
