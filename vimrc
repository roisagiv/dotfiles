" call plug#begin('~/.vim/plugged')
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'wincent/terminus'
Plug 'jszakmeister/vim-togglecursor'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'Chiel92/vim-autoformat'
Plug 'mhinz/vim-signify'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" Rails plugins
Plug 'tpope/vim-rails'

" JS plugins
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript'
Plug 'millermedeiros/vim-esformatter'
Plug 'mxw/vim-jsx'

call plug#end()

" vi no compatible
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme related stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let &t_Co=256 " 256 colors color schemes
" colorscheme rainbo
"let g:solarized_termcolors=16
"colorscheme solarized
syntax on " syntax highlighting on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=1000 " How many lines of history to remember
"set cf " enable error files and error jumping
" set clipboard+=unnamed " turns out I do like sharing windows clipboard
set ffs=unix,mac,dos " support all three, in this order
"set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,# " none of these should be word dividers, so make them not be
set nosol " leave my cursor where it was

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set wildmode=list:longest " turn on wild menu in special format (long format)
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png " ignore formats
set ruler " Always show current positions along the bottom
set cmdheight=1 " the command bar is 1 high
set number " turn on line numbers
" "set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
set mouse=a " use mouse everywhere
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
set list " we do what to show tabs, to ensure we get them out of my files
" "set listchars=tab:>-,trail:-,eol:$ " show tabs and trailing whitespace
set listchars=tab:»·,trail:·,precedes:«,extends:» " show tabs and trailing whitespace
 
" mostly does the right thing
set smartindent

" turns off tab character
set expandtab

" left size numbering, some people prefer relativenumber, but with easy motion this is irrelevent
set number

" 2 spaces for tabs and shifts
set tabstop=2 shiftwidth=2

" makes backspace work like most other apps
set backspace=2

" scroll offset, keeps 2 lines above the cursor
set scrolloff=2

" Use ; as : in your vimrc
nmap ; :

" Mapleader {{{
let mapleader=","
" " }}}

" toogle paste in cmd only
" nnoremap <Leader>p :set invpaste<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options for NERDTree, from https://github.com/scrooloose/nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NERDTree when no file is spcified!
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" CTRL N Toggles NERDTree
"map <silent> <C-n> :NERDTreeFocus<CR>
map <silent> <C-n> :NERDTreeToggle<CR>
" Close vim if NERDTree is the last windows
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

