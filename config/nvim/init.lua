-- ============================================================================
-- Basic Settings
-- ============================================================================

vim.opt.number = true              -- Show line numbers
vim.opt.relativenumber = true      -- Relative line numbers
vim.opt.autoindent = true          -- Auto indent new lines
vim.opt.smartindent = true         -- Smart indentation
vim.opt.mouse = 'a'                -- Enable mouse
vim.opt.ignorecase = true          -- Case insensitive search
vim.opt.smartcase = true           -- Unless uppercase is used
vim.opt.hlsearch = true            -- Highlight search results
vim.opt.incsearch = true           -- Incremental search
vim.opt.wrap = false               -- Don't wrap lines
vim.opt.breakindent = true         -- Preserve indentation in wrapped text
vim.opt.tabstop = 2                -- Tab width
vim.opt.shiftwidth = 2             -- Indent width
vim.opt.softtabstop = 2            -- Soft tab stop
vim.opt.expandtab = true           -- Use spaces instead of tabs
vim.opt.termguicolors = true       -- True color support
vim.opt.signcolumn = "yes"         -- Always show sign column
vim.opt.updatetime = 250           -- Faster completion
vim.opt.timeoutlen = 300           -- Faster key sequences
vim.opt.splitright = true          -- Vertical splits to the right
vim.opt.splitbelow = true          -- Horizontal splits below
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard
vim.opt.scrolloff = 8              -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8          -- Keep 8 columns visible when scrolling
vim.opt.undofile = true            -- Persistent undo

-- Set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ============================================================================
-- Bootstrap lazy.nvim (Plugin Manager)
-- ============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Plugins
-- ============================================================================

require("lazy").setup({
  -- Gruvbox color scheme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard", -- Options: "hard", "soft", ""
        transparent_mode = false,
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        filters = { dotfiles = false },
      })

      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
        }
      })

      -- Key mappings for Telescope
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
    end,
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript", "go", "rust", "bash", "c", "cpp", "zig" },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = { enable = true },
      })
    end,
  },

  -- LSP and autocompletion
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Python
      vim.lsp.config.pyright = {}
      vim.lsp.enable('pyright')

      -- Go
      vim.lsp.config.gopls = {}
      vim.lsp.enable('gopls')

      -- Rust
      vim.lsp.config.rust_analyzer = {
        settings = {
          ['rust-analyzer'] = {
            checkOnSave = {
              command = "clippy"
            },
          },
        },
      }
      vim.lsp.enable('rust_analyzer')

      -- Lua
      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true)
            }
          }
        }
      }
      vim.lsp.enable('lua_ls')

      -- C/C++
      vim.lsp.config.clangd = {}
      vim.lsp.enable('clangd')

      -- Zig
      vim.lsp.config.zls = {}
      vim.lsp.enable('zls')

      -- LSP keybindings
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
        end,
      })
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        })
      })
    end,
  },

  -- Formatting plugin
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "black" },
          lua = { "stylua" },
          go = { "gofmt" },
          rust = { "rustfmt" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },

  -- Which-key: Shows available keybindings
  {
    "folke/which-key.nvim",
    config = function()
      require('which-key').setup({})
    end,
  },

  -- Status line with Gruvbox theme
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox",
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        }
      })
    end,
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = {text = '+'},
          change = {text = '~'},
          delete = {text = '_'},
          topdelete = {text = '‾'},
          changedelete = {text = '~'},
        }
      })
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = false },
      })
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Comment plugin
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
})

-- ============================================================================
-- Key Mappings
-- ============================================================================

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Save file
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })

-- Quit
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })

-- Save and quit
vim.keymap.set('n', '<leader>x', ':x<CR>', { desc = 'Save and quit' })

-- Clear search highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

-- Better indenting in visual mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- Move lines up and down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move lines up' })
