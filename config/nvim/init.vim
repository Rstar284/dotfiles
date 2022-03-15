scriptencoding utf8

set modeline           " enable vim modelines
set hlsearch           " highlight search items
set incsearch          " searches are performed as you type
set number             " enable line numbers
set confirm            " ask confirmation like save before quit.
set wildmenu           " Tab completion menu when using command mode
set expandtab          " Tab key inserts spaces not tabs
set softtabstop=4      " spaces to enter for each tab
set shiftwidth=4       " amount of spaces for indentation
set shortmess+=aAcIws  " Hide or shorten certain messages
set relativenumber
set clipboard=unnamedplus
set encoding=UTF-8

let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

" ------ leader mapping ------
   
let g:mapleader = "<space>"

map <Leader> <Plug> e

" ------ command shortcuts ------
:command FZ FZF
:command EX Explore
:command PI PlugInstall
:command PC PlugClean
:command NT NERDTree

" -------- theme --------
set background=dark

" -------- limeline -------
set noshowmode
let g:lightline = { 
            \ 'colorscheme': 'tokyonight', 
            \ 'active': {
            \   'left': [[ 'mode', 'paste'],
            \       ['readonly', 'filename', 'modified']]
            \ },
            \ }


" ------- vim plug ---------
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/ap/vim-buftabline.git'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/w0rp/ale.git'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/dag/vim-fish.git'
Plug 'https://github.com/mhinz/vim-signify.git'
Plug 'https://github.com/tpope/vim-eunuch.git'
Plug 'https://github.com/junegunn/limelight.vim.git'
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'evanleck/vim-svelte'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'codechips/coc-svelte', {'do': 'npm install'}
Plug 'voldikss/vim-floaterm'
Plug 'neovim/nvim-lspconfig'
" Plug 'dylanaraps/wal.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'github/copilot.vim'
Plug 'andweeb/presence.nvim'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

inoremap nn <esc>

" enable mouse
set mouse=a
if has('mouse_sgr')
    " sgr mouse is better but not every term supports it
    set ttymouse=sgr
endif

" syntax highlighting
syntax enable

set linebreak breakindent

" change cursor shape for different editing modes, neovim does this by default
if !has('nvim')
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
        let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
    else
        let &t_SI = "\e[6 q"
        let &t_SR = "\e[4 q"
        let &t_EI = "\e[2 q"
    endif
endif

" ------ commands ------

command! D Explore
command! R call <SID>ranger()map <Leader> <Plug>
command! Q call <SID>quitbuffer()
command! -nargs=1 B :call <SID>bufferselect("<args>")
command! W execute 'silent w !sudo tee % >/dev/null' | edit!

" ------ basic maps ------

" open ranger as a file chooser using the function below
nnoremap <leader>r :call <SID>ranger()<CR>

" match string to switch buffer
nnoremap <Leader>b :let b:buf = input('Match: ')<Bar>call <SID>bufferselect(b:buf)<CR>

" change windows with ctrl+(hjkl)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" alt defaults
nnoremap 0 ^
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <Tab> ==1j

" re-visual text after changing indent
vnoremap > >gv
vnoremap < <gv

" toggle line numbers, nn (no number)
nnoremap <silent> <Leader>nn :set number!

" gj/k but preserve numbered jumps ie: 12j or 45kmap <Leader> <Plug>
nmap <buffer><silent><expr>j v:count ? 'j' : 'gj'
nmap <buffer><silent><expr>k v:count ? 'k' : 'gk'

" open a terminal in $PWD
nnoremap <silent> <Leader>tt :terminal<CR>

" tab control
nnoremap <silent> <M-j> :tabmove -1<CR>
nnoremap <silent> <M-k> :tabmove +1<CR>
nnoremap <silent> <Leader>te :tabnew<CR>
nnoremap <silent> <Leader>tn :tabnext<CR>
nnoremap <silent> <Leader>tf :tabfirst<CR>
nnoremap <silent> <Leader>tp :tabprevious<CR>

" close current buffer and/or tab
nnoremap <silent> <Leader>q :B<CR>:silent tabclose<CR>gT

" open a new tab in the current directory with netrw
nnoremap <silent> <Leader>- :tabedit <C-R>=expand("%:p:h")<CR><CR>

" split the window vertically and horizontally
nnoremap _ <C-W>s<C-W><Down>
nnoremap <Bar> <C-W>v<C-W><Right>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
" ------ autocmd ------

" Reload changes if file changed outside of vim requires autoread
augroup load_changed_file
    autocmd!
    autocmd FocusGained,BufEnter * if mode() !=? 'c' | checktime | endif
    autocmd FileChangedShellPost * echo "Changes loaded from source file"
augroup END

" when quitting a file, save the cursor position
augroup save_cursor_position
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" when not running in a console or a terminal that doesn't support 256 colors
" enable cursorline in the currently active window and disable it in inactive ones
if $DISPLAY !=? '' && &t_Co == 256
    augroup cursorline
        autocmd!
        autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        autocmd WinLeave * setlocal nocursorline
    augroup END
endif
map <Leader> <Plug>
" ------ adv maps ------


" strip trailing whitespace, ss (strip space)
nnoremap <silent> <Leader>ss
    \ :let b:_p = getpos(".") <Bar>
    \  let b:_s = (@/ != '') ? @/ : '' <Bar>
    \  %s/\s\+$//e <Bar>
    \  let @/ = b:_s <Bar>map <Leader> <Plug>
    \  nohlsearch <Bar>
    \  unlet b:_s <Bar>
    \  call setpos('.', b:_p) <Bar>
    \  unlet b:_p <CR>

" global replacemap <Leader> <Plug>
vnoremap <Leader>sw "hy
    \ :let b:sub = input('global replacement: ') <Bar>
    \ if b:sub !=? '' <Bar>
    \   let b:rep = substitute(getreg('h'), '/', '\\/', 'g') <Bar>
    \   execute '%s/'.b:rep."/".b:sub.'/g' <Bar>
    \   unlet b:sub b:rep <Bar>
    \ endif <CR>
nnoremap <Leader>sw
    \ :let b:sub = input('global replacement: ') <Bar>
    \ if b:sub !=? '' <Bar>
    \   execute "%s/<C-r><C-w>/".b:sub.'/g' <Bar>
    \   unlet b:sub <Bar>
    \ endif <CR>

" prompt before each replace
vnoremap <Leader>cw "hy
    \ :let b:sub = input('interactive replacement: ') <Bar>
    \ if b:sub !=? '' <Bar>
    \   let b:rep = substitute(getreg('h'), '/', '\\/', 'g') <Bar>
    \   execute '%s/'.b:rep.'/'.b:sub.'/gc' <Bar>
    \   unlet b:sub b:rep <Bar>
    \ endif <CR>

nnoremap <Leader>cw
    \ :let b:sub = input('interactive replacement: ') <Bar>
    \ if b:sub !=? '' <Bar>
    \   execute "%s/<C-r><C-w>/".b:sub.'/gc' <Bar>
    \   unlet b:sub <Bar>
    \ endif <CR>

" highlight long lines, ll (long lines)
let w:longlines = matchadd('ColorColumn', '\%'.&textwidth.'v', &textwidth)
nnoremap <silent> <Leader>ll
    \ :if exists('w:longlines') <Bar>
    \   silent! call matchdelete(w:longlines) <Bar>
    \   echo 'Long line highlighting disabled'
    \   <Bar> unlet w:longlines <Bar>
    \ elseif &textwidth > 0 <Bar>
    \   let w:longlines = matchadd('ColorColumn', '\%'.&textwidth.'v', &textwidth) <Bar>
    \   echo 'Long line highlighting enabled'
    \ <Bar> else <Bar>
    \   let w:longlines = matchadd('ColorColumn', '\%80v', 81) <Bar>
    \   echo 'Long line highlighting enabled'
    \ <Bar> endif <CR>

nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>

" discord
let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "The One True Text Editor Hehe"
let g:presence_client_id           = "793271441293967371"
let g:presence_debounce_timeout    = 10
let g:presence_enable_line_number  = 1
let g:presence_blacklist           = []
let g:presence_buttons             = 1
let g:presence_file_assets         = {}

let g:presence_editing_text        = "Suffering With %s"
let g:presence_file_explorer_text  = "Searching in %s"
let g:presence_git_commit_text     = "Committing changes *phew*"
let g:presence_plugin_manager_text = "Managing plugins"
let g:presence_reading_text        = "Trying to understand %s"
let g:presence_workspace_text      = "Working on %s"
let g:presence_line_number_text    = "Line %s out of %s"

let g:tokyonight_style="night"
" set color needs to be
" at the end of file to work
colorscheme tokyonight
