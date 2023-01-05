-- nvim-dap-ui
local ldap = require('dap')
-- require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog

ldap.adapters.python = {
    type = 'executable';
    command = 'python';
    args = { '-m', 'debugpy.adapter' };
}

ldap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    -- the type here established the link to the adapter definition: `dap.adapters.python`    
    type = 'python';
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
    program = "${file}";
    stopOnEntry = False;
    },
}

local ui = require("dapui")

ui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    {
      elements = {
        "scopes",
      },
      size = 0.3,
      position = "right"
    },
    {
      elements = {
        "repl",
        "breakpoints"
      },
      size = 0.3,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
})

vim.fn.sign_define('DapBreakpoint', { text = '⾍' })

-- Start debugging session
vim.keymap.set("n", "<localleader>ds", function()
  ldap.continue()
  ui.toggle({})
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
vim.keymap.set("n", "<localleader>dl", require("dap.ui.widgets").hover)
vim.keymap.set("n", "<localleader>dc", ldap.continue)
vim.keymap.set("n", "<localleader>db", ldap.toggle_breakpoint)
vim.keymap.set("n", "<localleader>dn", ldap.step_over)
vim.keymap.set("n", "<localleader>di", ldap.step_into)
vim.keymap.set("n", "<localleader>do", ldap.step_out)
vim.keymap.set("n", "<localleader>dC", function()
  ldap.clear_breakpoints()
  require("notify")("Breakpoints cleared", "warn")
end)

-- Close debugger and clear breakpoints
vim.keymap.set("n", "<localleader>de", function()
  ldap.clear_breakpoints()
  ui.toggle({})
  ldap.terminate()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
  require("notify")("Debugger session ended", "warn")
end)

-- some unicode chars for symbols 
-- ⾍
-- 🔴
-- ↯



