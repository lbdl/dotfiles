-- dap-init.lua
-- Entry point for setting up nvim-dap
local M = {}

function M.setup()
  require('dap-ui').setup()
  require('dap-keymaps').setup()
  require('dap-adapters').setup()
end

return M


