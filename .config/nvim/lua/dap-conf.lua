-- nvim-dap-ui
local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
    print("nvim-dap not installed!")
    return
end

require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog

dap.adapters.python = {
    type = 'executable',
    command = 'python',
    args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        -- the type here established the link to the adapter definition: `dap.adapters.python`
        type = 'python',
        request = 'launch',
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
        program = "${file}",
        stopOnEntry = False,
    },
}

local dap_ui_ok, ui = pcall(require, "dapui")
if not (dap_ui_ok) then
    require("notify")("dap-ui not installed!", "warning")
    return
end


vim.fn.sign_define('DapBreakpoint', { text = '⾍' })


-- Start debugging session
vim.keymap.set("n", "<localleader>ds", function()
    dap.continue()
    ui.toggle({})
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
vim.keymap.set("n", "<localleader>dl", require("dap.ui.widgets").hover)
vim.keymap.set("n", "<localleader>dc", dap.continue)
vim.keymap.set("n", "<localleader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<localleader>dn", dap.step_over)
vim.keymap.set("n", "<localleader>di", dap.step_into)
vim.keymap.set("n", "<localleader>do", dap.step_out)
vim.keymap.set("n", "<localleader>dC", function()
    dap.clear_breakpoints()
    require("notify")("Breakpoints cleared", "warn")
end)

-- Close debugger and clear breakpoints
vim.keymap.set("n", "<localleader>de", function()
    dap.clear_breakpoints()
    ui.toggle({})
    dap.terminate()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
    require("notify")("Debugger session ended", "warn")
end)

--some unicode chars for symbols
--⾍
--🔴
--↯
