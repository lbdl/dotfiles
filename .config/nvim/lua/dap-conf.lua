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
    print("dap-ui not ok")
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
vim.keymap.set("n", "<localleader>dt", ui.toggle())
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
    vim.notify("Breakpoints cleared", "warn")
end)

-- Close debugger and clear breakpoints
vim.keymap.set("n", "<localleader><F10>", function()
    dap.clear_breakpoints()
    dap.terminate()
    ui.close()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
    vim.notify("Debugger session ended", "warn")
end
)

--some unicode chars for symbols
--⾍
--🔴
--↯
--⚡
--
--
--
--
--
--
-- dap-conf.lua
--local status_ok, dap = pcall(require, "dap")
--if not status_ok then
    --return
--end

--local dapui_ok, dapui = pcall(require, "dapui")
--if not dapui_ok then
    --return
--end

--local dap_vt_ok, dap_vt = pcall(require, "nvim-dap-virtual-text")
--if dap_vt_ok then
    --dap_vt.setup({
        --enabled = true,
        --enabled_commands = true,
        --highlight_changed_variables = true,
        --highlight_new_as_changed = true,
        --show_stop_reason = true,
        --commented = false,
        --virt_text_pos = 'eol',
        --all_frames = true,
        --virt_lines = false,
        --virt_text_win_col = nil
    --})
--end

-- UI configuration
--dapui.setup({
    --icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
    --mappings = {
        --expand = { "<CR>", "<2-LeftMouse>" },
        --open = "o",
        --remove = "d",
        --edit = "e",
        --repl = "r",
        --toggle = "t",
    --},
    --layouts = {
        --{
            --elements = {
                --{ id = "scopes", size = 0.25 },
                --"breakpoints",
                --"stacks",
                --"watches",
            --},
            --size = 40,
            --position = "left",
        --},
        --{
            --elements = {
                --"repl",
                --"console",
            --},
            --size = 0.25,
            --position = "bottom",
        --},
    --},
    --controls = {
        --enabled = true,
        --element = "repl",
        --icons = {
            --pause = "",
            --play = "",
            --step_into = "",
            --step_over = "",
            --step_out = "",
            --step_back = "",
            --run_last = "",
            --terminate = "",
        --},
    --},
    --floating = {
        --max_height = nil,
        --max_width = nil,
        --border = "single",
        --mappings = {
            --close = { "q", "<Esc>" },
        --},
    --},
--})

-- Integrate with DAP events
--dap.listeners.after.event_initialized["dapui_config"] = function()
    --dapui.open()
--end
--dap.listeners.before.event_terminated["dapui_config"] = function()
    --dapui.close()
--end
--dap.listeners.before.event_exited["dapui_config"] = function()
    --dapui.close()
--end

-- Signs
--vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
--vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

-- Keymaps
--local opts = { noremap = true, silent = true }
--vim.keymap.set('n', '<F5>', function() dap.continue() end, opts)
--vim.keymap.set('n', '<F10>', function() dap.step_over() end, opts)
--vim.keymap.set('n', '<F11>', function() dap.step_into() end, opts)
--vim.keymap.set('n', '<F12>', function() dap.step_out() end, opts)
--vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, opts)
--vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, opts)
--vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, opts)
--vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end, opts)
--vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end, opts)

-- UI toggle keymaps
--vim.keymap.set('n', '<Leader>du', function() dapui.toggle() end, opts)

-- Adapters configurations
--dap.adapters.lldb = {
    --type = 'executable',
    --command = '/usr/bin/lldb-vscode',
    --name = 'lldb'
--}

--dap.configurations.rust = {
    --{
        --name = 'Launch',
        --type = 'lldb',
        --request = 'launch',
        --program = function()
            --return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        --end,
        --cwd = '${workspaceFolder}',
        --stopOnEntry = false,
        --args = {},
        --runInTerminal = false,
    --},
--}
