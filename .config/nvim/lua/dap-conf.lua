-- nvim-dap-ui
local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
    print("nvim-dap not installed!")
    return
end

dap.set_log_level('DEBUG') -- Helps when configuring DAP, see logs with :DapShowLog

dap.listeners.after.event_initialised["dapui_config"] = function()
require('dapui').open()
end
dap.listeners.after.event_terminated["dapui_config"] = function()
require('dapui').close()
end
dap.listeners.after.event_exited["dapui_config"] = function()
require('dapui').close()
end

--- NEODEV:
local neodev_ok, n_dev = pcall(require, "neodev")
if not (neodev_ok) then
    print("neodev not installed")
    return
end
n_dev.setup({
    library = {
        plugins = { "neotest", "nvim-dap-ui" }, types = true },
})

--- DAP-UI
local dap_ui_ok, ui = pcall(require, "dapui")
if not (dap_ui_ok) then
    require("notify")("dap-ui not installed!", "warning")
    return
end

ui.setup()

vim.fn.sign_define('DapBreakpoint', { text = '🔴' })


-- Start debugging session
vim.keymap.set("n", "<localleader><F2>", function()
    dap.continue()
    ui.open()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
--vim.keymap.set("n", "<localleader>dt", ui.toggle())
vim.keymap.set("n", "<localleader>dl", require("dap.ui.widgets").hover )
vim.keymap.set("n", "<localleader><F5>", function() dap.continue() end )
vim.keymap.set("n", "<localleader><F3>", function() dap.toggle_breakpoint() end )
vim.keymap.set("n", "<localleader><F6>", function() dap.step_over() end )
vim.keymap.set("n", "<localleader><F7>", function() dap.step_into() end )
vim.keymap.set("n", "<localleader><F8>", function() dap.step_out() end )
vim.keymap.set("n", "<localleader><F9>", function() ui.toggle() end )
vim.keymap.set("n", "<localleader><F12>", function() dap.terminate() end )
vim.keymap.set("n", "<localleader><F11>", function()
    dap.clear_breakpoints()
    require("notify")("Breakpoints cleared", "warn")
end)

-- Close debugger and clear breakpoints
vim.keymap.set("n", "<localleader><F10>", function()
    dap.clear_breakpoints()
    dap.terminate()
    ui.close()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
    require("notify")("Debugger session ended", "warn")
end
)

--some unicode chars for symbols
--⾍
--🔴
--↯
--⚡
