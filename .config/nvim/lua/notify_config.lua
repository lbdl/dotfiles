local M = {}

function M.setup()
    local status_ok, notify = pcall(require, 'notify')
    if not status_ok then
        return
    end

    notify.setup({
        timeout = 3000,
        stages = 'fade_in_slide_out',
        icons = {
            ERROR = 'x',
            WARN = '!',
            INFO = '',
            DEBUG = '',
            TRACE = '✎',
        },
        background_colour = '#000000',
    })

    -- Set as default notification system
    vim.notify = notify
end

return M
