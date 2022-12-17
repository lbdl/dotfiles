return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig'
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
    -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

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
    -- telescope
    -- we also need brew install ripgrep for telescope
    -- see :checkhealth telescope and install instructions
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- Make telescope faster
end)
