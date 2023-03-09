-- nvim-dap-ui
local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
    print("nvim-dap not installed!")
    return
end

dap.set_log_level('DEBUG') -- Helps when configuring DAP, see logs with :DapShowLog

--[[dap.adapters.python = {]]
    --[[type = 'executable';]]
    --[[command = '/Users/tims/.pyenv/versions/nvim3-10/bin/python';]]
    --[[args = { '-m', 'debugpy.adaptor' };]]
--[[}]]

--[[dap.configurations.python = {]]
    --[[{]]
        --[[-- The first three options are required by nvim-dap]]
        --[[-- the type here established the link to the adapter definition: `dap.adapters.python`]]
        --[[type = 'python';]]
        --[[request = 'launch';]]
        --[[name = "Launch file";]]

        --[[-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings]]
        --[[program = "${file}";]]
        --[[stopOnEntry = False;]]
    --[[},]]
--[[}]]

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

vim.fn.sign_define('DapBreakpoint', { text = '⾍' })


-- Start debugging session
vim.keymap.set("n", "<localleader>ds", function()
    dap.continue()
    ui.toggle()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
--vim.keymap.set("n", "<localleader>dt", ui.toggle())
vim.keymap.set("n", "<localleader>dl", require("dap.ui.widgets").hover)
vim.keymap.set("n", "<localleader>dc", dap.continue)
vim.keymap.set("n", "<localleader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<localleader>dn", dap.step_over)
vim.keymap.set("n", "<localleader>di", dap.step_into)
vim.keymap.set("n", "<localleader>do", dap.step_out)
vim.keymap.set("n", "<localleader>dt", function()
    dap.terminate()
end
)
vim.keymap.set("n", "<localleader>d<S-c>", function()
    dap.clear_breakpoints()
    require("notify")("Breakpoints cleared", "warn")
end)

-- Close debugger and clear breakpoints
vim.keymap.set("n", "<localleader>de", function()
    dap.clear_breakpoints()
    ui.toggle()
    dap.terminate()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
    require("notify")("Debugger session ended", "warn")
end)

--some unicode chars for symbols
--⾍
--🔴
--↯
