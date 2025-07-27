-- latex-config.lua
-- LaTeX/vimtex configuration

local M = {}

function M.setup()
    -- vimtex configuration
    vim.g.vimtex_view_method = 'skim'  -- Use Skim PDF viewer on Mac
    vim.g.vimtex_compiler_latexmk = {
        build_dir = 'build',  -- Keep build files organized
        callback = 1,
        continuous = 1,
        executable = 'latexmk',
        hooks = {},
        options = {
            '-verbose',
            '-file-line-error',
            '-synctex=1',
            '-interaction=nonstopmode',
        },
    }

    -- Enable concealment for cleaner editing
    vim.g.vimtex_syntax_conceal = {
        accents = 1,
        ligatures = 1,
        cites = 1,
        fancy = 1,
        spacing = 1,
        greek = 1,
        math_bounds = 1,
        math_delimiters = 1,
        math_fracs = 1,
        math_super_sub = 1,
        math_symbols = 1,
        sections = 0,
        styles = 1,
    }

    -- Disable some vimtex mappings that might conflict
    vim.g.vimtex_mappings_disable = { ['n'] = { 'K' } }  -- Keep K for LSP hover

    -- Quickfix window configuration
    vim.g.vimtex_quickfix_method = 'pplatex'
    vim.g.vimtex_quickfix_mode = 2  -- Open quickfix on errors

    -- LaTeX file type autocmd
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function()
            vim.opt_local.conceallevel = 2  -- Enable concealment
            vim.opt_local.wrap = true
            vim.opt_local.linebreak = true
            vim.opt_local.textwidth = 80
            vim.opt_local.formatoptions = "tcqj"
            
            -- LaTeX-specific keymaps
            vim.keymap.set('n', '<leader>lc', '<cmd>VimtexCompile<CR>', { buffer = true })
            vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<CR>', { buffer = true })
            vim.keymap.set('n', '<leader>lt', '<cmd>VimtexTocToggle<CR>', { buffer = true })
            vim.keymap.set('n', '<leader>le', '<cmd>VimtexErrors<CR>', { buffer = true })
            vim.keymap.set('n', '<leader>ls', '<cmd>VimtexStop<CR>', { buffer = true })
            vim.keymap.set('n', '<leader>lk', '<cmd>VimtexClean<CR>', { buffer = true })
        end
    })
end

return M
