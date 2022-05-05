-- editor settings
vim.cmd [[set rtp+=/home/rstar284/.config/nvim/lua/]]
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.undofile = true
vim.o.lazyredraw = true
vim.o.inccommand = "nosplit"
vim.o.updatetime = 100
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.complete = "kspell"
vim.o.spelllang = "en"
vim.o.spellsuggest = "best,9"
vim.o.completeopt = "menu,noinsert,noselect,preview"

if vim.fn.has("clipboard") == 1 then
    vim.opt.clipboard:append("unnamedplus")
end

-- Restore cursor to previous position in previous editing session
vim.cmd([[
augroup restore_cursor
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
]])

-- Remove trailing whitespace on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

-- Format on save
vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])

-- line numbers
vim.wo.relativenumber = true
vim.wo.number = true
