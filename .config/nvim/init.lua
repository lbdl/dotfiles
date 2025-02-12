-- Basic Options
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.cmd('colorscheme monokai')
vim.opt.wrap = true


vim.g.python3_host_prog = '~/.pyenv/versions/nvim3-10/bin/python'
vim.g.ruby_host_prog = '~/.rbenv/versions/3.2.1/bin/neovim-ruby-host'

-- Title and Encoding
vim.opt.title = true
vim.opt.encoding = 'utf-8'

-- Error Handling
vim.opt.visualbell = true  -- no error bells visual nor audio

-- Swap and Backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Leaders
vim.g.mapleader = ";"
vim.g.maplocalleader = "\\"

-- Mouse
vim.opt.mouse = 'a'

-- Status Line
vim.opt.showmode = true
vim.opt.laststatus = 2
vim.opt.statusline = '%<%F %m%r%=%(%l,%c%) %P'
vim.opt.clipboard = 'unnamed'
vim.opt.backspace = 'indent,eol,start'

-- Search Settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Key Mappings
vim.keymap.set('n', '<CR>', ':noh<CR>', { silent = true })

-- Clipboard
vim.opt.clipboard = 'unnamedplus'

-- GitGutter Settings
vim.opt.updatetime = 250
vim.g.gitgutter_sign_added = '++'
vim.g.gitgutter_sign_modified = '>'
vim.g.gitgutter_sign_removed = '--'
vim.g.gitgutter_sign_removed_first_line = '^'
vim.g.gitgutter_sign_modified_removed = '<'

-- GitGutter Mappings
vim.keymap.set('n', '<leader><S-g>n', ':GitGutterNextHunk<CR>')
vim.keymap.set('n', '<leader><S-g><S-n>', ':GitGutterPrevHunk<CR>')
vim.keymap.set('n', '<leader><S-g>a', ':GitGutterStageHunk<CR>')
vim.keymap.set('n', '<leader><S-g>u', ':GitGutterUndoHunk<CR>')
vim.keymap.set('n', '<leader>gs', ':Magit<CR>')

-- Indentation Settings
vim.g.indentLine_char = '⦙'

-- File Type Specific Settings
-- YAML
vim.api.nvim_create_autocmd("FileType", {
    pattern = "yaml",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end
})

-- Vagrant
vim.api.nvim_create_augroup("vagrant", { clear = true })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "Vagrantfile",
    group = "vagrant",
    command = "set filetype=ruby"
})

-- Fastlane
vim.api.nvim_create_augroup("fastlane", { clear = true })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"Fastfile", "Appfile"},
    group = "fastlane",
    command = "set filetype=ruby"
})

-- Solidity
vim.api.nvim_create_autocmd("FileType", {
    pattern = "solidity",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.textwidth = 0
    end
})

-- NERDCommenter for Solidity
vim.g.NERDCustomDelimiters = {
    solidity = {
        left = '//',
        leftAlt = '/*',
        rightAlt = '*/'
    }
}

-- UltiSnips
vim.g.UltiSnipsSnippetDirectories = {"UltiSnips", "snip"}

-- LaTeX Settings
vim.g.vimtex_compiler_method = 'latexmk'
vim.api.nvim_create_augroup("filetype_tex", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    group = "filetype_tex",
    command = "set spell spelllang=en_gb"
})

-- Golang Settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.tabstop = 4
    end
})


-- Go Highlight Settings
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_structs = 1
vim.g.go_highlight_types = 1

-- JSON Settings
vim.g.vim_json_syntax_conceal = 0
vim.g.markdown_syntax_conceal = 0


-- Load Additional Lua Configurations
-- Load colorscheme first as other modules might depend on it
--require('colorscheme')

-- Initialize base plugins that others depend on
local mason_ok, mason = pcall(require, 'mason')
if mason_ok then
    mason.setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
end

-- Setup Mason-LSPconfig after Mason
local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if mason_lspconfig_ok then
    mason_lspconfig.setup({
        ensure_installed = {
            "gopls",
            "rust_analyzer",
            "pylsp",
            "ruby_lsp",
            "yamlls",
            "dockerls",
            "ts_ls",
        },
        automatic_installation = true
    })
end

-- Load LSP configurations
local lspconfig_ok, _ = pcall(require, 'lspconfig')
if lspconfig_ok then
    require('lsp-dap')  -- Your LSP configuration file
    require('diagnostic-config')
end

-- Load general configurations
require('plug')    -- Your plugin configurations
require('opts')    -- Your additional options
require('keys')    -- Your key mappings

-- Initialize DAP and debugging tools
local dap_ok, dap = pcall(require, 'dap')
if dap_ok then
    -- Initialize DAP-UI with error handling
    local dapui_ok, dapui = pcall(require, 'dapui')
    if dapui_ok then
        dapui.setup({
            layouts = {
                {
                    elements = {
                        'scopes',
                        'breakpoints',
                        'stacks',
                        'watches',
                    },
                    size = 40,
                    position = 'left',
                },
                {
                    elements = {
                        'repl',
                        'console',
                    },
                    size = 10,
                    position = 'bottom',
                },
            },
        })
        
        -- Add DAP event listeners
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end

    -- Setup Python DAP
    local dap_python_ok, dap_python = pcall(require, 'dap-python')
    if dap_python_ok then
        dap_python.setup('~/.pyenv/versions/nvim3-10/bin/python')
    end
end

-- Load your remaining plugin configurations
require('plugin_config')

-- Initialize UI elements last
local lualine_ok, lualine = pcall(require, 'lualine')
if lualine_ok then
    lualine.setup()
end

