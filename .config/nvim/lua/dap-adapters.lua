-- dap-adapters.lua
local M = {}

function M.setup()
  local dap = require('dap')

  -- LLDB adapter (Rust/C/C++)
  local lldb_path = '/opt/homebrew/opt/llvm/bin/lldb-dap'

  if vim.fn.executable(lldb_path) == 1 then
    -- Define both lldb and rt_lldb to avoid checkhealth errors
    dap.adapters.lldb = {
      type = 'executable',
      command = lldb_path,
      name = 'lldb',
    }

    dap.adapters.rt_lldb = {
      type = 'executable',
      command = lldb_path,
      name = 'lldb-rt',
    }

    dap.configurations.rust = {
      {
        name = 'Launch Rust binary',
        type = 'rt_lldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
      },
    }
  end
end

return M
