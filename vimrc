" call plug#begin('~/.vim/plugged')
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'wincent/terminus'
Plug 'jszakmeister/vim-togglecursor'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'
Plug 'mhinz/vim-signify'
Plug 'tmux-plugins/vim-tmux-focus-events'


" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs' " insert or delete brackets, parens, quotes in pair

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'

" Auto complete
if has('nvim')
  Plug 'Shougo/deoplete.nvim'
else
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
endif

" Rails plugins
Plug 'tpope/vim-rails'

" JS plugins
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript'
Plug 'millermedeiros/vim-esformatter'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax' " Improved JavaScript syntax.
Plug 'othree/javascript-libraries-syntax.vim' " Syntax for JS libraries.
Plug 'mephux/vim-jsfmt'

" Themes & Colors
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'w0ng/vim-hybrid'

" Ctags
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" Search
Plug 'rking/ag.vim'

call plug#end()

" vi no compatible
set nocompatible

" ==============================================================================
" VARIABLES
" ==============================================================================
let working_folder=fnamemodify(resolve(expand('<sfile>:p')), ':h')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme related stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes and colors
set background=dark
let base16colorspace=256
let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1
" colorscheme hybrid
" colorscheme base16-default

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
else
  if !empty($BASE16_THEME)
    let base16colorspace=256
    exec "set background=" . $BASE16_VARIATION
    "echom 'setting colorscheme to ' . $BASE16_THEME
    colorscheme $BASE16_THEME
  endif
endif

set t_Co=256
let &t_Co=256 " 256 colors color schemes

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

" swp file
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

" Automatically re-read files changed outside
set autoread
set copyindent
set undolevels=1000

" you have a fast terminal
set ttyfast
" set ttyscroll=3

set completeopt-=preview  " Do not show preview window for ins-completion.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
map <silent> <C-n> :NERDTreeFocus<CR>
" map <silent> <C-n> :NERDTreeToggle<CR>
" Close vim if NERDTree is the last windows
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"make the nerd tree use a new look
let NERDTreeDirArrows   = 1
let NERDTreeHijackNetrw = 0
let NERDTreeShowFiles=1
let NERDTreeShowHidden=0
let NERDTreeMinimalUI = 1
let NERDTreeHighlightCursorline=1


"""""""""""""""""""""""""""
" ctrlp.vim
"""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
    \ 'dir':  '.*(_build$\|deps$\|\.git$\|\.hg$\|\.svn$\|log$\|_public$\|node_modules$\|bower_components$\|tmp$\|vendor/bundle$\|vendor/cache$\|coverage$\|vendor/mongodb$\|vendor/redis$)$',
    \ 'file': '\.swp$\|\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

""""""""""""""""""""""""""""
" Plugin Settings - airline 
""""""""""""""""""""""""""""
let g:airline_left_sep = ''        " Remove arrow symbols.
let g:airline_left_alt_sep = ''    " Remove arrow symbols.
let g:airline_right_sep = ''       " Remove arrow symbols.
let g:airline_right_alt_sep = ''   " Remove arrow symbols.
let g:airline_theme = 'hybridline' " Use hybrid theme.

"""""""""""""""
" vim-jsfmt
"""""""""""""""
let g:js_fmt_autosave = 1 " Enable auto fmt on save

""""""""""""""""""
" AutoComplete
""""""""""""""""""
if has('nvim')

  " DEOPLETE

  let g:deoplete#enable_at_startup = 1
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

  let g:deoplete#enable_smart_case = 1
  let g:deoplete#auto_completion_start_length = 1  " Set minimum syntax keyword length.

  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

endif

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

"""""""
" ctags
"""""""
" Where to look for tags files
set tags=./tags;,~/.vimtags

" Use jsctags for javascript files
" @see https://github.com/xolox/vim-easytags/issues/92
let g:easytags_languages = {
\   'javascript': {
\     'cmd': "jsctags",
\     'args': [],
\     'fileoutput_opt': '-f',
\     'stdout_opt': '-f-',
\     'recurse_flag': '-R'
\   }
\}

" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
" let g:easytags_suppress_ctags_warning = 1

""""""
" Tagbar
"""""""
nmap <F8> :TagbarToggle<CR>
