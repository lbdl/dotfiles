-- Neotest
require("neotest").setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
        })
    },
    output_panel = {
        enabled = false,
        open = "bot split | resize 15"
    },
    output = {
        enabled = true,
        open_on_run = true,
    }
})
