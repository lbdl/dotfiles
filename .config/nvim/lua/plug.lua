local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig'
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

    -- patched fonts
    use 'nvim-tree/nvim-web-devicons'

    -- lualine
    use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }

    -- Completion framework:
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    -- Colours etc
    use "rebelot/kanagawa.nvim"

    -- DAP adaptor
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use "antoinemadec/FixCursorHold.nvim"

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- lua vim config lsp stuff
    use "folke/neodev.nvim"

    -- git stuff
    use 'jreybert/vimagit'
    use 'airblade/vim-gitgutter'

    -- Protocol Stuff
    use 'cstrahan/vim-capnp'

    -- YAML/K8s etc
    use 'Yggdroot/indentLine'
    use 'nathanaelkane/vim-indent-guides'

    -- Java
    use 'mfussenegger/nvim-jdtls'

    -- Autosave
    use({
        "Pocco81/auto-save.nvim",	
        config = function()	 
            require("auto-save").setup {
                -- your config goes here	
                -- -- or just leave it empty :) 
            }	
        end,
    })


    -- commenting 
    use 'preservim/nerdcommenter'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'nvim-treesitter/nvim-treesitter'

    --use 'puremourning/vimspector'
    use 'voldikss/vim-floaterm'
    use "norcalli/nvim-colorizer.lua"
    use "rcarriga/nvim-notify"

    -- telescope
    -- we also need brew install ripgrep for telescope
    -- see :checkhealth telescope and install instructions
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- Make telescope faster
    use { 'nvim-tree/nvim-tree.lua' } -- Filesystem navigation

        -- refactoring for PY
    use { "python-rope/ropevim",
        run = "pip install ropevim",
        disable = false
    }

    -- code search stuff
    use 'preservim/tagbar'
    -- debuggger gui
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- testing frameworks
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        }
    }
    use "nvim-neotest/neotest-python"
end
)
