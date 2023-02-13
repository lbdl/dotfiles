-- Completion Plugin Setup
local cmp = require('cmp')
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources:
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
    { name = 'orgmode'},                            -- source for orgmode
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})
-- Colorizer
require 'colorizer'.setup()

-- org-mode
--require('orgmode').setup_ts_grammar()

-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup {
      ensure_installed = { "bash", "c", "cmake", "css", "dockerfile", "go", "gomod", "gowork", "hcl", "help", "html",
        "http", "javascript", "json", "lua", "make", "markdown", "python", "regex", "ruby", "rust", "toml", "vim", "yaml",
        "zig", "org", "proto" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {'org'},
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<S-Tab>", -- normal mode
            node_incremental = "<Tab>", -- visual mode
            node_decremental = "<S-Tab", -- visual mode
        },
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
    }
}

-- org-mode
--require('orgmode').setup({
    --org_agenda_files = {'~/org-mode/**/*'},
    --org_default_notes_file = {'~/org-mode/refile.org'},
--})

-- Neotest
require("neotest").setup({
  adapters = {
    require("neotest-python")
  },
  output_panel = {
      enabled = false,
      open = "bot split | resize 15"
    },
    output = {
        enabled = true,
        open_on_run = true;
    }
})

-- gopls
require('lspconfig').gopls.setup{}

-- Telescope Setup
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "^./.git/",
            "^./target/",
            "LICENSE*"
        },
        layout_strategy = 'vertical',
        layout_config = { height = 0.95, width = 0.95 },
    },
    extensions = {
        --media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          --  filetypes = { "png", "webp", "jpg", "jpeg", "ppm", "pdf" },
            --find_cmd = "rg", -- find command (defaults to `fd`)
       -- },
    },
}

-- Nvim Tree Setup
require('nvim-tree').setup {

    sort_by = "case_sensitive",
    view = {
        adaptive_size = false,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
        icons = {
            git_placement = "after",
            glyphs = {
                git = {
                    unstaged = "-",
                    staged = "s",
                    untracked = "u",
                    renamed = "r",
                    deleted = "d",
                    ignored = "i",
                },
            },
        },
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false,
    },
}
