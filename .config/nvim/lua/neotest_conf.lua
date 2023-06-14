-- neotest config options

local map_opts = { noremap = true, silent = true, nowait = true }

local neotest_ok, ntest = pcall(require, "neotest")

if not neotest_ok then
    print "Could not require neotest"
    return
end

ntest.setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
        })
    },
    quickfix = {
        open = false,
    },
    floating = {
        border = "rounded",
        max_height = 0.9,
        max_width = 0.9,
        options = {}
    },
    summary = {
        open = "botright vsplit | vertical resize 60"
    },
    args = { "-v", "--cov" }
})

vim.keymap.set(
    "n",
    "<localleader>tt",
    function()
        ntest.run.run()
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<localleader>tl",
    function()
        ntest.run.last()
        ntest.summary.open()
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<localleader>tf",
    function()
        ntest.run.run(vim.fn.expand("%"))
        ntest.summary.open()
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<localleader>to",
    function()
        ntest.output.open({enter = true})
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<localleader>tc",
    function()
        ntest.summary.close()
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<localleader>ts",
    function()
        ntest.run.stop()
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<localleader>td",
    function()
        ntest.run.run({ strategy = "dap" })
        require('dapui').open()
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<localleader>tg",
    function()
        ntest.summary.toggle()
    end,
    map_opts
)
