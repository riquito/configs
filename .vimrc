set t_Co=256

set nocompatible               " be iMproved

" ### Vundle Configuration

filetype off                   " required by Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required by Vundle
Bundle 'gmarik/vundle'

" My Bundles
" 
" original repos on github

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'

Bundle 'tsaleh/vim-matchit'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'vim-scripts/svn-diff.vim'
Bundle 'vim-scripts/toggle_maximize.vim'

Bundle 'sjl/gundo.vim.git'

" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
Bundle 'vim-colors-solarized'

filetype plugin indent on     " required by Vundle

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" ### END OF VUNDLE CONFIGURATION

" vim-powerline customizations
let g:Powerline_symbols = 'fancy'
set laststatus=2 " always show the status line

" conf for svndiff
let g:svndiff_autoupdate = 1

" blue for new lines
hi DiffAdd ctermfg=16 ctermbg=69 guibg='blue' 
" yellow for modified lines
hi DiffChange ctermfg=16 ctermbg=3 guibg='yellow'
" pink/red for deleted lines
hi DiffDelete   ctermfg=16 ctermbg=1 guibg='red'

noremap <F3> :call Svndiff("prev")<CR> 
noremap <F4> :call Svndiff("next")<CR>
noremap <F5> :call Svndiff("clear")<CR>

sign define svndiff_add    text=> texthl=diffAdd
sign define svndiff_delete text=< texthl=diffDelete
sign define svndiff_change text=x texthl=diffChange

syntax enable
set background=dark
"let g:solarized_termcolors=16
"set t_Co=16
colorscheme solarized

"do not put an empty line at end of file when saving
set noeol
set binary


nmap j gj
nmap k gk

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" List chars
set listchars="" " Reset the listchars
set listchars=tab:\ \ " a tab should display as " ", trailing whitespace as "."
set listchars+=trail:. " show trailing spaces as dots
set listchars+=extends:> " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen
set listchars+=precedes:< " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen

" toggle NERDTree
nmap <leader>e :NERDTreeToggle<CR>

" show at bottom right that <leader> key is active
set showcmd

" accept mouse click select words,text,focus windows
set mouse=a

" CtrlP customizations
nmap <leader>b :CtrlPBuffer " show the buffer list<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*~,*pyc,*pyo,*/cache/*,*/vendor/*,*/uploads/*,*/adimg/*,*/apimg/*

" autocompletion in ex mode should stop at the shortest prefix
set wildmode=longest,list,full
set wildmenu

" use django syntax highlighting for twig files
au BufNewfile,BufRead *.twig set syntax=django

" toggle fullscreen of the current buffer
nnoremap <F11> :ZoomWin<CR>

"Show the miniBufExplorer from the start
let g:miniBufExplorerMoreThanOne = 0

"Still haven't discovered what it does
let g:miniBufExplMapWindowNavArrows = 1

set hidden

" persistent undo
set undofile               " Save undo's after file closes
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" gundu keyboard mappings
nnoremap <leader>u :GundoToggle<Cr>

" indentation settings
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
" set backspace=indent,eol,start

" Switch buffers
" note that I must first define what is <C-PageUp> for urxt
" http://cygwin.com/ml/cygwin-xfree/2006-07/msg00011.html
nmap    <ESC>[5^    <C-PageUp>
nmap    <ESC>[6^    <C-PageDown>
nnoremap <silent> <C-PageDown> :bnext<cr>
nnoremap <silent> <C-PageUp> :bprevious<cr>