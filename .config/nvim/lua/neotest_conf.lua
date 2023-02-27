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
    }
})

vim.keymap.set(
    "n",
    "<leader>tt",
    function()
        ntest.run.run()
        ntest.summary.open()
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<leader>tl",
    function()
        ntest.run.last()
        ntest.summary.open()
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<leader>tf",
    function()
        ntest.run.run(vim.fn.expand("%"))
        ntest.summary.open()
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<leader>to",
    function()
        ntest.output.open()
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<leader>tc",
    function()
        ntest.summary.close()
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<leader>ts",
    function()
        ntest.run.stop()
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<leader>td",
    function()
        ntest.run.run({ strategy = "dap" })
    end,
    map_opts
)

vim.keymap.set(
    "n",
    "<leader>tg",
    function()
        ntest.summary.toggle()
    end,
    map_opts
)
