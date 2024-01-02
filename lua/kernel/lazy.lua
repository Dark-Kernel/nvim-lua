
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'MunifTanjim/nui.nvim',
    "nvim-lua/plenary.nvim",
    'rcarriga/nvim-notify',
    'hrsh7th/nvim-cmp',
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  'nvim-telescope/telescope-symbols.nvim',


  {
    "nvim-neorg/neorg",
    config = function()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                    },
                },
            },
        }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
},
{
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
    { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },
  'tpope/vim-fugitive',
  'rafamadriz/friendly-snippets',
  'https://github.com/ycm-core/YouCompleteMe.git',
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    }
  },
  'https://github.com/ryanoasis/vim-devicons',
  'https://github.com/vim-airline/vim-airline',
  'https://github.com/dylanaraps/wal.vim',
  'eandrju/cellular-automaton.nvim',
  'https://github.com/ap/vim-css-color',
  'https://github.com/fourjay/vim-keeper.git',
  'https://github.com/pearofducks/ansible-vim.git',
  'https://github.com/m4xshen/autoclose.nvim.git',
  'https://tpope.io/vim/commentary.git',
  'https://github.com/christoomey/vim-tmux-navigator.git',
  'fedepujol/move.nvim',
  {
      "folke/noice.nvim",
      config = function()
          require("noice").setup({
              -- add any options here
          })
      end,
      requires = {
          -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
          "MunifTanjim/nui.nvim",
          -- OPTIONAL:
          --   `nvim-notify` is only needed, if you want to use the notification view.
          --   If not available, we use `mini` as the fallback
          
      }
  },

  {
      "folke/trouble.nvim",
      dependencies = {"nvim-tree/nvim-web-devicons"},
      config = function()
          require("trouble").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  },

  {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  },

  { "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },



})
