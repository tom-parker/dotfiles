set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" VCS
Plugin 'tpope/vim-fugitive'

" System
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'sophacles/vim-bundle-sparkup'
Plugin 'corntrace/bufexplorer'
Plugin 'bling/vim-airline'

" Syntaxes and such.
Plugin 'leshill/vim-json'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'

" Python bundles
Plugin 'fs111/pydoc.vim'
Plugin 'vim-scripts/pep8'
Plugin 'atourino/jinja.vim'
Plugin 'vim-scripts/python_match.vim'

" Fun, but not useful
Plugin 'altercation/vim-colors-solarized'
Plugin 'skammer/vim-css-color'
Plugin 'mgutz/vim-colors'
Plugin 'ehamberg/vim-cute-python'
Plugin 'Gundo'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'honza/snipmate-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-markdown'
Plugin 'ctrlp.vim'
Plugin 'tsaleh/vim-matchit'
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on

" Configurations
""""""""""""""""
set guifont=Menlo\ for\ Powerline
set background=dark

" Wildmenu completion
"""""""""""""""""""""
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pyc                            " Python byte code

" Save when losing focus
set autowriteall " Auto-save files when switching buffers or leaving vim.
au FocusLost * silent! :wa
au TabLeave * silent! :wa

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="
filetype plugin indent on

autocmd FileType html set ft=html.html " For SnipMate
au BufRead,BufNewFile *.html set filetype=html.html

" Colours
colorscheme chance-of-storm

" Basic
syntax enable
set number        " always show line numbers
set hidden        " Allow un-saved buffers in background
set clipboard=unnamed " Share system clipboard.
set backspace=indent,eol,start " Make backspace behave normally.
set directory=/tmp// " swap files
set backupskip=/tmp/*,/private/tmp/*
set ffs=unix,dos,mac "Default file types
set nowrap        " don't wrap lines
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "  case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Remove the toolbar if we're running under a GUI (e.g. MacVIM).
if has("gui_running")
  set guioptions=-t
endif

" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:→\ ,trail:·

" Tabs & spaces
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

" General Code Folding
""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

" Highlight VCS conflict markers
""""""""""""""""""""""""""""""""
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" I CAN HAZ NORMAL REGEXES?
"""""""""""""""""""""""""""
nnoremap / /\v
vnoremap / /\v

" General auto-commands
"""""""""""""""""""""""
autocmd FileType * setlocal colorcolumn=0
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Get rid of trailing whitespace highlighting in mutt.
autocmd FileType mail highlight clear ExtraWhitespace
autocmd FileType mail setlocal listchars=

" Crontab auto-commands
"""""""""""""""""""""""
autocmd FileType crontab setlocal backupcopy=yes

" Markdown auto-commands
""""""""""""""""""""""""
autocmd FileType markdown setlocal wrap linebreak nolist

" PHP Configurations
""""""""""""""""""""
autocmd FileType php setlocal colorcolumn=100

" Python configurations
"""""""""""""""""""""""
au BufNewFile,BufReadPost python setlocal shiftwidth=2 expandtab
autocmd FileType python setlocal colorcolumn=80
autocmd FileType python let g:pep8_map='<F4>'

" Coffeescript configurations
"""""""""""""""""""""""""""""
au BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent
au BufNewFile,BufReadPost *.coffee setlocal shiftwidth=2 expandtab

" Javascript configurations
"""""""""""""""""""""""""""
au BufNewFile,BufReadPost *.js setlocal shiftwidth=4 tabstop=4 expandtab

" Get jinja filetype selection working correctly for *.jinja.html files.
au BufNewFile,BufReadPost *.jinja.html setlocal filetype=htmljinja

" Make sure we hilight extra whitespace in the most annoying way possible.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

"autocmd BufWritePre *.js :%s/\s\+$//e
"autocmd BufWritePre *.html :%s/\s\+$//e
"autocmd BufWritePre *.css :%s/\s\+$//e
"autocmd BufWritePre *.less :%s/\s\+$//e

" Custom mappings
""""""""""""""""""

" Change leader
let mapleader = ","
let g:mapleader = ","

" Get rid of search hilighting with ,/
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null


" Plugin configurations
""""""""""""""""""""""""

" TagBar
nnoremap <silent> <F2> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autoshowtag = 1

" NERDTree
nnoremap <Leader>g :NERDTreeToggle<CR>

" Sparkup
let g:sparkupExecuteMapping = '<c-y>'
let g:sparkupNextMapping = '<c-k>'

" Double rainbow - What does it mean!?
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set laststatus=2
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0

let &t_Co=256

noremap <leader>b :BufExplorer<return>

nnoremap <leader>u :GundoToggle<CR>
inoremap <leader>u <c-o>:GundoToggle<CR>

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

map <leader>gs :Gstatus<CR>
map <leader>gw :Gwrite<CR>
map <leader>gc :Gcommit<CR>
map <leader>gb :Gblame<CR>
map <leader>gd :Gdiff<CR>
map <leader>ge :Gedit<CR>

let g:Powerline_symbols = 'fancy'

autocmd VimEnter * NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
 " Line and Col Hilighting               
au WinLeave * set nocursorline nocursorcolumn                                                                                                                                                                                                                             
au WinEnter * set cursorline cursorcolumn
au BufLeave * set nocursorline nocursorcolumn
au BufEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

nnoremap   <Up>     <NOP>
nnoremap   <Down>   <NOP>
nnoremap   <Left>   <NOP>
nnoremap   <Right>  <NOP>

let g:airline_powerline_fonts = 1
