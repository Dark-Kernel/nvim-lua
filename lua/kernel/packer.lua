-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- use {
	  -- 'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- -- or                            , branch = '0.1.x',
	  -- requires = { {'nvim-lua/plenary.nvim'} }
  -- }
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }


  use {
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
}
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('tpope/vim-fugitive')
  use('rafamadriz/friendly-snippets')
  use('https://github.com/ycm-core/YouCompleteMe.git')
  use('https://github.com/L3MON4D3/LuaSnip.git')
  use('https://github.com/hrsh7th/nvim-cmp.git')
  use('https://github.com/ryanoasis/vim-devicons')
  use('https://github.com/vim-airline/vim-airline')
  use('https://github.com/dylanaraps/wal.vim')
  use('eandrju/cellular-automaton.nvim')
  use('https://github.com/ap/vim-css-color')
  use('https://github.com/fourjay/vim-keeper.git')
  use('https://github.com/pearofducks/ansible-vim.git')
  use('https://github.com/m4xshen/autoclose.nvim.git')
  use('https://tpope.io/vim/commentary.git')
  use('https://github.com/saadparwaiz1/cmp_luasnip.git')
  use('https://github.com/christoomey/vim-tmux-navigator.git')
  use('fedepujol/move.nvim')
  use({
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
          "rcarriga/nvim-notify",
      }
  })

  use {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
          require("trouble").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  }

  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })



end)
