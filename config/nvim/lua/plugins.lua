require "paq" {
  "savq/paq-nvim"; -- Let Paq manage itself
  "lewis6991/impatient.nvim"; -- Impatient.nvim
  "folke/tokyonight.nvim"; -- Tokyonight.nvim
  "kyazdani42/nvim-tree.lua"; -- Tree
  "nvim-lualine/lualine.nvim"; -- Lualine
  "kyazdani42/nvim-web-devicons"; -- Web Devicons
  "akinsho/bufferline.nvim"; -- Bufferline
  "nathom/filetype.nvim"; -- Filetype
  "github/copilot.vim"; -- Copilot
  "neovim/nvim-lspconfig"; -- LSP
  "hrsh7th/nvim-cmp"; -- Cmp
  "hrsh7th/cmp-nvim-lsp"; -- Cmp LSP
  "hrsh7th/cmp-buffer"; -- Cmp Buffer
  "hrsh7th/cmp-path"; -- Cmp Path
  "saadparwaiz1/cmp_luasnip"; -- Cmp LuaSnip
  "L3MON4D3/LuaSnip"; -- LuaSnip
  "simrat39/rust-tools.nvim"; -- Rust Tools
  "tpope/vim-fugitive"; -- Fugitive
  "tpope/vim-rhubarb"; -- Rhubarb
  "numToStr/Comment.nvim"; -- Comment
  "nvim-treesitter/nvim-treesitter"; -- Treesitter
  "nvim-treesitter/nvim-treesitter-textobjects"; -- Treesitter Textobjects
  "andweeb/presence.nvim"; -- Presence
  "tweekmonster/startuptime.vim"; -- Startuptime
  "jghauser/mkdir.nvim"; -- Mkdir
  "Pocco81/AutoSave.nvim"; -- AutoSave
  "mbbill/undotree"; -- Undotree
  "Iron-E/nvim-cartographer"; -- Cartographer
  "sbdchd/neoformat"; -- Neoformat
  "goolord/alpha-nvim"; -- Alpha
  'BlakeJC94/alpha-nvim-fortune'; -- Alpha Fortune
  "nvim-lua/telescope.nvim"; -- Telescope
  "folke/trouble.nvim"; -- Trouble
  'stevearc/dressing.nvim'; -- Dressing
  "ellisonleao/glow.nvim"; -- Glow.nvim
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }; -- Telescope FZF
  "nvim-lua/plenary.nvim"; -- Plenary
  "Shatur/neovim-session-manager", -- Session Manager
  "nvim-lua/popup.nvim"; -- Popup
  "rcarriga/nvim-notify";
  "lewis6991/gitsigns.nvim"; -- Gitsigns
}

require('plugins/alpha')
require('plugins/nvim-tree')
require('plugins/nvim-lspconfig')
require('plugins/session_manager')
require('plugins/lualine')
require('plugins/treesitter')
require('plugins/presence')
require('plugins/notify')
require('plugins/trouble')
require('Comment').setup()
