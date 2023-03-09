return {
    "rcarriga/nvim-notify",
    config = function()
        local colors = require("colorscheme")

        vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = colors.samuraiRed })
        vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = colors.samuraiRed })
        vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = colors.samuraiRed })
        vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = colors.roninYellow })
        vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = colors.roninYellow })
        vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = colors.roninYellow })
        vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = colors.springGreen })
        vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = colors.springGreen })
        vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = colors.springGreen })
        vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = colors.fujiGray })
        vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = colors.fujiGray })
        vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = colors.fujiGray })
        vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = colors.fujiGray })
        vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = colors.fujiGray })
        vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = colors.fujiGray })

        require("notify").setup({
            background_colour = colors.sumiInk1
        })
    end
}
