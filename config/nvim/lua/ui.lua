vim.o.termguicolors = true

-- colorscheme
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.cmd[[colorscheme tokyonight]]

-- Terminal Settings
-- vim.go.splitright = true
vim.go.splitbelow = true
vim.cmd [[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <c-q> <c-\><c-n>:bd!<cr>
    au TermOpen * startinsert
    au TermOpen * set nonumber
  augroup end
]]

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- status line
require("plugins/lualine")

-- buffer line
require("plugins/bufferline")

-- Treesitter syntax highlighting
require("plugins/treesitter")
