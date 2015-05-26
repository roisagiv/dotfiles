" Use vim settings, rather then vi settings
set nocompatible

" Vundle Settings
" ===============
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'chriskempson/base16-vim'
Plugin 'chriskempson/tomorrow-theme'
" Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'tpope/vim-endwise'

call vundle#end()            " required

" recognize filetype of files you open (required)
filetype plugin indent on
filetype plugin on

" Misc Settings
" ==================

" leader keys
let mapleader=","
let maplocalleader="\\"

" enable copy/paste to clipboard
set clipboard=unnamed

" syntax highlighting
syntax on

" prevent vim from adding empty line at the end of every file
set noeol
set binary

" presentation settings
colorscheme base16-default
set number              " precede each line with its line number
set numberwidth=5       " number of culumns for line numbers
set textwidth=0         " Do not wrap words (insert)
set nowrap              " Do not wrap words (view)
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.

" indentation
set autoindent 		" automatically indents new line
set tabstop=2	    " number of spaces in a tab
set shiftwidth=2	" number of spaces for indent
set expandtab 		" expand tabs into spaces

" search setings
set incsearch       " Incremental search
set hlsearch        " Highlight search match
set ignorecase      " Do case insensitive matching
set smartcase       " do not ignore if search pattern has CAPS

" backspace
set backspace=indent,eol,start
set noswapfile
" Plugin Settings
" ==================

""" NERDTree
" Ctrl-P to display the file browser tree
" nmap <C-P> :NERDTreeToggle<CR>

" ,p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>
"Open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""" =============
""" NERDCommenter
""" =============
let NERDCreateDefaultMappings=0 " disable default mappings
let NERDSpaceDelims=2           " place spaces after comment chars
let NERDDefaultNesting=0        " don't recomment commented lines

" ,/ to invert comment on the current line/selection
nmap <leader>/ <Plug>NERDCommenterToggle
vmap <leader>/ <Plug>NERDCommenterToggle

""" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nmap <leader>. :CtrlPClearCache<cr>:CtrlP<cr>
nmap <leader>l :CtrlPLine<cr>
nmap <leader>b :CtrlPBuff<cr>
nmap <leader>m :CtrlPBufTag<cr>
nmap <leader>M :CtrlPBufTagAll<cr>

let g:ctrlp_clear_cache_on_exit = 1
" ctrlp leaves stale caches behind if there is another vim process runnin
" which didn't use ctrlp. so we clear all caches on each new vim invocation
cal ctrlp#clra()

let g:ctrlp_max_height = 40

" jump to buffer in the same tab if already open
let g:ctrlp_switch_buffer = 1

" if in git repo - use git file listing command, should be faster
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard -cod']
endif

" open multiple files with <c-z> to mark and <c-o> to open. v - opening in
" vertical splits; j - jump to first open buffer; r - open first in current buffer
let g:ctrlp_open_multiple_files = 'vjr'

let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'mixed', 'line']"

""" =========
""" Syntastic
""" =========
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint']

""" ======
""" vim-go
""" ======
" Disable opening browser after posting to your snippet to play.golang.org:
let g:go_play_open_browser = 0

" Enable goimports to automatically insert import paths instead of gofmt:
let g:go_fmt_command = "goimports"

" By default syntax-highlighting for Functions, Methods and Structs is disabled. To change it:
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

""" ===========
""" CtrlP-Funky
""" ===========
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

""" ==============
""" vim-autoformat
""" ==============
noremap <F3> :Autoformat<CR><CR>

""" ======
""" tagbar
""" ======
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

""" ==========
""" indentLine
""" ==========
let g:indentLine_color_term = 239

""" ==========
""" vim-rails
""" =========
let g:rsenseHome = '/usr/local/bin/rsense'
let g:rsenseUseOmniFunc = 1
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

