-- Neotest
require("neotest").setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
        })
    }
})

--vim.keymap.set("n", "<localleader>dl", require("dap.ui.widgets").hover)

vim.keymap.set('n', '<localleader>tt', function() return require('neotest').run.run() end)
vim.keymap.set('n', '<localleader>tl', function() return require('neotest').run.run_last() end)
vim.keymap.set('n', '<localleader>tf', function() return require('neotest').run.run(vim.fn.expand("%")) end)
vim.keymap.set('n', '<localleader>td', function() return require('neotest').run.run({ strategy = "dap" }) end)
vim.keymap.set('n', '<localleader>ts', function() return require('neotest').summary.toggle() end)
vim.keymap.set('n', '<localleader>to', function() return require('neotest').output.open({ enter = true }) end)
vim.keymap.set('n', '<localleader>tp', function() return require('neotest').output_panel.open() end)
