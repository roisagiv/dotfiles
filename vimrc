" call plug#begin('~/.vim/plugged')
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'wincent/terminus'
Plug 'jszakmeister/vim-togglecursor'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'
Plug 'ruanyl/vim-fixmyjs'
Plug 'mhinz/vim-signify'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Syntax
Plug 'sheerun/vim-polyglot'

if has('nvim')
  Plug 'benekastah/neomake'
  " Plug 'benjie/neomake-local-eslint.vim'
else
  Plug 'scrooloose/syntastic'
endif

Plug 'JarrodCTaylor/vim-reflection' " insert or delete brackets, parens, quotes in pair

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'

" Auto complete
if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  " Plug 'Shougo/context_filetype.vim'
else
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
endif

" Rails plugins
Plug 'tpope/vim-rails'
Plug 'osyo-manga/vim-monster'

" JS plugins
Plug 'ternjs/tern_for_vim', { 'do': 'npm install --update' }
Plug 'pangloss/vim-javascript'
if has('nvim')
  Plug 'neovim/node-host'
  Plug 'bigfish/vim-js-context-coloring', { 'branch': 'neovim', 'do': 'npm install --update' }
endif
Plug 'millermedeiros/vim-esformatter'
Plug 'mxw/vim-jsx'
" Plug 'jelera/vim-javascript-syntax' " Improved JavaScript syntax.
Plug 'othree/javascript-libraries-syntax.vim' " Syntax for JS libraries.
Plug 'othree/jsdoc-syntax.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'othree/yajs.vim'
" Plug 'marcelbeumer/javascript-syntax.vim'
" Plug 'mephux/vim-jsfmt'
Plug 'editorconfig/editorconfig-vim'

" CSS & Sass
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/csscomplete.vim'

" HTML
Plug 'othree/html5.vim'
Plug 'davidosomething/syntastic-hbstidy'
Plug 'alvan/vim-closetag'
Plug 'gregsexton/MatchTag'

" Handlebars
Plug 'mustache/vim-mustache-handlebars'
Plug 'joukevandermaas/vim-ember-hbs'

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

" devicons
Plug 'ryanoasis/vim-devicons'

" Buffers
Plug 'jeetsukumaran/vim-buffergator'
Plug 'qpkorr/vim-bufkill'


call plug#end()

" vi no compatible
set nocompatible
set lazyredraw

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

:command WQ wq
:command Wq wq
:command W w
:command Q q<Paste>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=1000 " How many lines of history to remember
"set cf " enable error files and error jumping
set ffs=unix,mac,dos " support all three, in this order
"set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,# " none of these should be word dividers, so make them not be
set nosol " leave my cursor where it was
set encoding=utf8
set cursorline " Highlight current line

if has('nvim')
  " Use unnamed registers for clipboard
  set clipboard+=unnamedplus
else
  " This allows you to share Vim's clipboard with OS X.
  set clipboard=unnamed
endif

" swp file
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

" Automatically re-read files changed outside
set autoread
set copyindent
set undolevels=1000

" you have a fast terminal
" set ttyfast
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
let NERDTreeShowHidden=1
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
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

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
" let g:airline_theme = 'hybridline' " Use hybrid theme.
let g:airline_powerline_fonts = 1

" Smarter tab line
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""
" vim-jsfmt
"""""""""""""""
let g:js_fmt_autosave = 0 " Enable auto fmt on save

""""""""""""""
" vim-polyglot
""""""""""""""
let g:polyglot_disabled = ['css','javascript','html']

""""""""""""""""""
" AutoComplete
""""""""""""""""""
if has('nvim')

  " DEOPLETE

  set omnifunc=syntaxcomplete#Complete
  let g:deoplete#enable_at_startup = 1

  let g:deoplete#omni#input_patterns = {}
  let g:deoplete#omni#input_patterns.html = '<[^>]*'
  let g:deoplete#omni#input_patterns.css = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
  let g:deoplete#omni#input_patterns.scss = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'

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

" Autocomplete ids and classes in CSS
autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
autocmd FileType html,html.handlebars,markdown setlocal omnifunc=htmlcomplete#CompleteTags

" javascript
let g:used_javascript_libs = 'jquery,chai,handlebars'
let g:js_context_colors_highlight_function_names=1
let g:js_context_colors_colorize_comments = 1

"""""""
" ctags
"""""""
" Where to look for tags files
set tags=./tags;,tags;,~/.vimtags

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
" let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 1
let g:easytags_resolve_links = 1
" let g:easytags_suppress_ctags_warning = 1

""""""""
" Tagbar
""""""""
nmap <F8> :TagbarToggle<CR>

""""""""""""
" Autoformat
""""""""""""
noremap <F3> :Autoformat<CR>
au filetype html.handlebars noremap <F3> :Autoformat html<CR><CR>
" let g:formatdef_eslint = '"eslint-formatter"'
" let g:formatters_javascript = ['eslint']
let g:fixmyjs_engine = 'eslint'
noremap <Leader><Leader>f :Fixmyjs<CR>

""""""""
" ag.vim
""""""""
let g:ag_working_path_mode="r"

"""""""""""""
" WebDevIcons
"""""""""""""
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

"""""""""""""
" vim-bufkill
"""""""""""""
map <Leader>bd :BD<CR>  " Fast close buffer (using vim buf-kill)

"""""""""""
" syntastic
"""""""""""
let g:syntastic_javascript_checkers=['jshint', 'eslint']
let g:syntastic_html_tidy_exec = 'tidy'

" Map some filetypes, e.g. turn off html checkers on handlebars (I'm using my
" hbstidy instead of html tidy)
let g:syntastic_filetype_map = {
      \   'html.handlebars': 'handlebars',
      \   'markdown.pandoc': 'markdown',
      \ }

let g:syntastic_ignore_files = [
      \ '\m\.min\.js$',
      \ '\m\.min\.css$',
      \ ]

let g:syntastic_handlebars_checkers  = ['handlebars', 'hbstidy']

" Ignore handlebars stuff in tidy
let g:syntastic_html_tidy_ignore_errors = [
      \   ' allowed in <head> elements',
      \   '{{',
      \ ]

let g:neomake_warning_sign = {
      \ 'text': '✹',
      \ }

let g:neomake_error_sign = {
      \ 'text': '✖',
      \ }

if executable('eslint')
  let g:neomake_javascript_enabled_makers = ['eslint']
else
  echoe 'No eslint executable detected. Install eslint for JavaScript syntax higlighting. `npm install -g eslint`'
endif

if exists('g:plugs["neomake"]')
  if has('autocmd')
    autocmd! BufWritePost * Neomake
  endif
endif

" Force filetype
autocmd BufRead,BufNewFile .eslintrc setfiletype json
autocmd BufRead,BufNewFile .jshintrc setfiletype json
autocmd BufRead,BufNewFile .jsbeautifyrc setfiletype json

""""HTML
" enable autoclose tag on xml files
let g:closetag_filenames = "*.html,*.hbs"

" enable mustache abbreviations
let g:mustache_abbreviations = 1

""""""""""""""""
" ESFORMATTER
""""""""""""""""
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>
