-- vim-plug
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'lewis6991/impatient.nvim'
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug('scrooloose/nerdtree', { on =  {'NERDTreeToggle', 'NERDTree'}})
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nathom/filetype.nvim'
Plug 'github/copilot.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-copilot'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'andweeb/presence.nvim'
Plug 'tweekmonster/startuptime.vim'
Plug 'jghauser/mkdir.nvim'
Plug 'Pocco81/AutoSave.nvim'
Plug 'mbbill/undotree'
Plug 'Iron-E/nvim-cartographer'
vim.call('plug#end')
