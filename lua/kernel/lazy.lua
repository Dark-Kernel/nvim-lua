
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
    -- 'MunifTanjim/nui.nvim', -- popup window for menus and inputs
    -- "nvim-lua/plenary.nvim",
    'nvim-telescope/telescope-symbols.nvim',
    {
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_config = {
						vertical = { height = 0.5 },
					},
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
				},
				pickers = {
					find_files = {
						follow = true,
					},
				},

				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })
			vim.keymap.set(
				"n",
				"<leader>/",
				builtin.current_buffer_fuzzy_find,
				{ desc = "/ Fuzzily search in current buffer" }
			)
			-- vim.keymap.set("n", "<leader>fs", function()
			-- 	builtin.live_grep({
			-- 		grep_open_files = true,
			-- 		prompt_title = "Live Grep in Open Files",
			-- 	})
			-- end, { desc = "Search / in Open Files" })
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Search Neovim files" })
		end,
	},
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
        config = function()
            vim.keymap.set('i', '<C-y>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
        end
    }, 

  { 'echasnovski/mini.indentscope', version = false },
    { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },


-------------------- Autocompletion -------------------------------------------------------------------------

  -- {
	-- "L3MON4D3/LuaSnip",
	-- -- follow latest release.
	-- version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- -- install jsregexp (optional!).
	-- build = "make install_jsregexp"
  -- },
  {     'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },
  'fedepujol/move.nvim',
  'rafamadriz/friendly-snippets',
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    }
  },
    {
    'nvim-lualine/lualine.nvim',
    'nativerv/lualine-wal.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
  'https://github.com/dylanaraps/wal.vim',
  'https://github.com/pearofducks/ansible-vim.git',
  'https://github.com/m4xshen/autoclose.nvim.git',
  'https://tpope.io/vim/commentary.git',
  'https://github.com/christoomey/vim-tmux-navigator.git',
--  {
--      "folke/noice.nvim",
--      config = function()
--          require("noice").setup({
--              -- add any options here
--          })
--      end,
--      requires = {
--          -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--          "MunifTanjim/nui.nvim",
--          -- OPTIONAL:
--          --   `nvim-notify` is only needed, if you want to use the notification view.
--          --   If not available, we use `mini` as the fallback
--          
--      }
--  },
-- {
--     'rcarriga/nvim-notify',
--     config = function ()
--       require("notify").setup {
--         stages = 'fade_in_slide_out',
--         background_colour = 'FloatShadow',
--         timeout = 3000,
--       }
--       vim.notify = require('notify')
--     end
-- },
{ 'echasnovski/mini.notify', version = false },

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
  { 'Z-xus/float.nvim' },

  -- {
  --     "iamcco/markdown-preview.nvim",
  --     run = function() vim.fn["mkdp#util#install"]() end,
  -- },

  -- { "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },


})
