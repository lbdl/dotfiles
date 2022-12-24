local nvim_lsp = require('lspconfig')
require'snippets'.use_suggested_mappings(true) -- for snippets.vim
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Code actions
capabilities.textDocument.codeAction = {
  dynamicRegistration = false;
      codeActionLiteralSupport = {
          codeActionKind = {
              valueSet = {
                 "",
                 "quickfix",
                 "refactor",
                 "refactor.extract",
                 "refactor.inline",
                 "refactor.rewrite",
                 "source",
                 "source.organizeImports",
              };
          };
      };
}

-- Snippets
-- capabilities.textDocument.completion.completionItem.snippetSupport = true;

-- LSPs
local servers = { 
                    "docker-langserver", 
                    "rust_analyzer", 
                    "gopls", 
                    "pylsp" 
                }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { 
        capabilities = capabilities;
        on_attach = on_attach;
        init_options = {
            onlyAnalyzeProjectsWithOpenFiles = true,
            suggestFromUnimportedLibraries = false,
            closingLabels = true,
        };
    }
end

-- Lua LSP. NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
require('nlua.lsp.nvim').setup(require('lspconfig'), {
    capabilities = capabilities;
    on_attach = on_attach;
    init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = false,
        closingLabels = true,
    };
})
