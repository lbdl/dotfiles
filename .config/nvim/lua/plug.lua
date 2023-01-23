return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig'
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

    -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- DAP adaptor
    use 'mfussenegger/nvim-dap'

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- git stuff
    use 'jreybert/vimagit'
    use 'airblade/vim-gitgutter'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'      
    use 'nvim-treesitter/nvim-treesitter'
    use 'puremourning/vimspector'
    use 'voldikss/vim-floaterm'
    use "norcalli/nvim-colorizer.lua"
    use "rcarriga/nvim-notify"
    -- telescope
    -- we also need brew install ripgrep for telescope
    -- see :checkhealth telescope and install instructions
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- Make telescope faster
    use { 'kyazdani42/nvim-tree.lua', -- Filesystem navigation
        requires = 'kyazdani42/nvim-web-devicons' } -- Filesystem icons
    use { 'nvim-lualine/lualine.nvim', -- Statusline
        requires = { 'kyazdani42/nvim-web-devicons', opt = true } }   

    -- org-mode
    use {'nvim-orgmode/orgmode', config = function() 
            require('orgmode').setup{}
        end
        }

    -- refactoring for PY
    use { "python-rope/ropevim", 
        run = "pip install ropevim",
        disable = false 
    }
    -- code search stuff
    use 'preservim/tagbar'
    -- debuggger gui 
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    
    -- testing frameworks
    use "nvim-neotest/neotest-python"
    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim"
      }
    }
end)
