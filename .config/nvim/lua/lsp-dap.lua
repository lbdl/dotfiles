print("DEBUG: lsp-dap.lua file started loading")
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    -- Set some keybinds conditional on server capabilities
    if client.server_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.server_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
end

-- Define capabilities for LSP servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- LSPs
-- these have been installed via Mason
-- rust_analyzer needs setup as below via rustaceanvim (replaces rust-tools)
vim.g.rustaceanvim = {
    server = {
        cmd = { "rust-analyzer" },
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", function() vim.cmd.RustLsp({ 'hover', 'actions' }) end, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", function() vim.cmd.RustLsp('codeAction') end, { buffer = bufnr })
        end,
    },
}


-- Rest of LSP's below
-- see :h mason-lspconfig

-- example to setup sumneko and enable call snippets
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            },
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

--require('lspconfig').cairo_ls.setup {
    --capabilities = capabilities,
    --on_attach = on_attach,
    --init_options = {
        --onlyAnalyzeProjectsWithOpenFiles = true,
        --suggestFromUnimportedLibraries = false,
        --closingLabels = true,
    --},
--}

-- LaTeX LSP (ltex-ls) configuration - DISABLED for spell checking
-- Using Neovim's native spell checking instead
print("DEBUG: lsp-dap.lua is loading")
print("DEBUG: About to setup ltex with en-GB")
vim.lsp.config('ltex', {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        -- Filter out US spelling diagnostics
        -- vim.diagnostic.config({
        --     virtual_text = {
        --         source = "if_many",
        --         format = function(diagnostic)
        --             if diagnostic.source == "LTeX" and
        --                diagnostic.code and
        --                string.match(diagnostic.code, "MORFOLOGIK_RULE_EN_US") then
        --                 return nil  -- Hide this diagnostic
        --             end
        --             return diagnostic.message
        --         end
        --     }
        -- }, bufnr)
    end,
    settings = {
        ltex = {
            language = "en-GB",
            enabled = { "latex", "tex", "bib" },
            diagnosticSeverity = "information",
            disabledRules = {
                ["en-GB"] = {"OXFORD_SPELLING_Z_NOT_S", "ENGLISH_WORD_REPEAT_BEGINNING_RULE", "ID_CASING", "MORFOLOGIK_RULE_EN_GB"}
            }
        },
    },
    filetypes = { "tex", "latex", "bib" },
})

vim.lsp.config('pyright', {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        -- Use Neovim's Black but understand project's Python
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                pattern = "*.py",
                callback = function()
                    -- Always use Neovim's Black (consistent, always available)
                    local nvim_python_dir = vim.fn.fnamemodify(vim.g.python3_host_prog, ':h')
                    local black_path = nvim_python_dir .. '/black'
                    local ruff_path = nvim_python_dir .. '/ruff'

                    if vim.fn.executable(black_path) == 1 then
                        vim.cmd("!" .. black_path .. " --quiet " .. vim.fn.expand("%"))
                        vim.cmd("edit")
                    end

                     -- Then lint and fix with Ruff
                    if vim.fn.executable(ruff_path) == 1 then
                        vim.cmd("!" .. ruff_path .. " check --fix --quiet " .. vim.fn.expand("%"))
                    end

                    vim.cmd("edit") -- Reload the file to show all changes

                end,
            })
        end
    end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                indexing = true,
            },
            -- Let Pyright detect project's Python but Neovim uses its own tools
            pythonPath = nil,
            venvPath = vim.fn.expand('~/.pyenv/versions'),
        },
    },
    root_markers = {
        'pyproject.toml',
        '.python-version',
        'setup.py',
        'requirements.txt',
        '.git',
    },
})

vim.lsp.config('biome', {
  -- Basic setup
  cmd = { "biome", "lsp-proxy" },
  filetypes = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescriptreact" },
  root_markers = { "biome.json", "biome.jsonc", ".git" },
  -- Additional settings if needed
  settings = {
    -- You can add specific Biome LSP settings here if needed
  },
})

vim.lsp.config('dockerls', {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = false,
        closingLabels = true,
    },
})

vim.lsp.config('ruby_lsp', {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = false,
        closingLabels = true,
    },
})

-- Setup completion capabilities
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config('solidity', {
    capabilities = capabilities,
    cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
    on_attach = on_attach,
    root_markers = { "foundry.toml" },
    init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = false,
        closingLabels = true,
    }
})

vim.lsp.config('ts_ls', {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = false,
        closingLabels = true,
    },
})

--require('lspconfig').gopls.setup {
--    capabilities = capabilities,
--    on_attach = on_attach,
--    init_options = {
--        onlyAnalyzeProjectsWithOpenFiles = true,
--        suggestFromUnimportedLibraries = false,
--        closingLabels = true,
--    },
--}

vim.lsp.config('marksman', {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = false,
        closingLabels = true,
    },
})

vim.api.nvim_set_hl(0, 'markdownCode', {
    fg = '#F92672',
    bg = '#272822'
})

vim.lsp.config('yamlls', {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = false,
        closingLabels = true,
    },
})

-- Enable all configured servers
vim.lsp.enable({
    'lua_ls',
    'ltex',
    'pyright',
    'biome',
    'dockerls',
    'ruby_lsp',
    'solidity',
    'ts_ls',
    'marksman',
    'yamlls',
})


-----------------------------
-- lsp-dap.lua
--local on_attach = function(client, bufnr)
    --local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    --local opts = { noremap = true, silent = true }

    -- Set some keybinds conditional on server capabilities
    --if client.server_capabilities.document_formatting then
        --buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    --elseif client.server_capabilities.document_range_formatting then
        --buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    --end

    -- Set autocommands conditional on server_capabilities
    --if client.server_capabilities.document_highlight then
        --vim.api.nvim_exec([[
        --hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        --hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        --hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        --augroup lsp_document_highlight
        --autocmd! * <buffer>
        --autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        --autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        --augroup END
        --]], false)
    --end
--end

--local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Code actions
--capabilities.textDocument.codeAction = {
    --dynamicRegistration = false,
    --codeActionLiteralSupport = {
        --codeActionKind = {
            --valueSet = {
                --"",
                --"quickfix",
                --"refactor",
                --"refactor.extract",
                --"refactor.inline",
                --"refactor.rewrite",
                --"source",
                --"source.organizeImports",
            --},
        --},
    --},
--}

-- Enhanced rust-tools setup with error handling
--local rt_ok, rt = pcall(require, "rust-tools")
--if rt_ok then
    --rt.setup({
        --server = {
            --capabilities = capabilities,
            --on_attach = function(client, bufnr)
                ---- Call the common LSP attach function first
                --on_attach(client, bufnr)
                
                ---- Rust-specific keymaps
                --vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                --vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            --end,
        --},
        --tools = {
            --hover_actions = {
                --auto_focus = true,
            --},
            --inlay_hints = {
                --auto = true,
                --show_parameter_hints = true,
            --},
        --},
    --})
--end

-- LSP setups
--local lspconfig = require('lspconfig')

--require('lspconfig').pylsp.setup {
    --capabilities = capabilities,
    --on_attach = on_attach,
    --init_options = {
        --onlyAnalyzeProjectsWithOpenFiles = true,
        --suggestFromUnimportedLibraries = false,
        --closingLabels = true,
    --},
--}

--require('lspconfig').dockerls.setup {
    --capabilities = capabilities,
    --on_attach = on_attach,
    --init_options = {
        --onlyAnalyzeProjectsWithOpenFiles = true,
        --suggestFromUnimportedLibraries = false,
        --closingLabels = true,
    --},
--}

--require('lspconfig').ruby_lsp.setup {
    --capabilities = capabilities,
    --on_attach = on_attach,
    --init_options = {
        --onlyAnalyzeProjectsWithOpenFiles = true,
        --suggestFromUnimportedLibraries = false,
        --closingLabels = true,
    --},
--}

--require('lspconfig').solidity.setup {
    --capabilities = capabilities,
    --cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
    --on_attach = on_attach,
    --root_pattern = require("lspconfig.util").root_pattern("foundry.toml"),
    --init_options = {
        --onlyAnalyzeProjectsWithOpenFiles = true,
        --suggestFromUnimportedLibraries = false,
        --closingLabels = true,
    --}
--}

--require('lspconfig').ts_ls.setup {
    --capabilities = capabilities,
    --on_attach = on_attach,
    --init_options = {
        --onlyAnalyzeProjectsWithOpenFiles = true,
        --suggestFromUnimportedLibraries = false,
        --closingLabels = true,
    --},
    --settings = {
        --typescript = {
            --semanticTokens = {
                --enable = false
            --}
        --}
    --}
--}

--require('lspconfig').ltex.setup {
    --capabilities = capabilities,
    --on_attach = on_attach,
    --language = "en.GB",
    --init_options = {
        --onlyAnalyzeProjectsWithOpenFiles = true,
        --suggestFromUnimportedLibraries = false,
        --closingLabels = true,
    --},
--}

--require('lspconfig').yamlls.setup {
    --capabilities = capabilities,
    --on_attach = on_attach,
    --init_options = {
        --onlyAnalyzeProjectsWithOpenFiles = true,
        --suggestFromUnimportedLibraries = false,
        --closingLabels = true,
    --},
--}
