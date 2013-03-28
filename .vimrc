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
Bundle 'vim-scripts/toggle_maximize.vim'
Bundle 'airblade/vim-gitgutter'
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

" Note: to toggle fullscreen of the current buffer
" the standard keys are C-F (full), C-V (vertical only), C-H (horizontal only)

"Show the miniBufExplorer from the start
let g:miniBufExplorerMoreThanOne = 0

"Still haven't discovered what it does
let g:miniBufExplMapWindowNavArrows = 1

" Let me swap between buffers without being asked to save first
set hidden

" highlight current line
set cursorline
hi CursorLine ctermbg=Black " highlight bg color of current line
hi CursorColumn ctermbg=Yellow " highlight cursor

" vim-gitgutter settings
hi link GitGutterAdd DiffAdd
hi link GitGutterChange DiffChange
hi link GitGutterDelete DiffDelete
hi link GitGutterChangeDelete DiffChangeDelete
hi SignColumn ctermbg=None  " not a proper vim-gitgutter setting, but related
let g:gitgutter_sign_column_always=1
let g:gitgutter_highlight_lines=0

" persistent undo
set undofile               " Save undo's after file closes
set undodir=~/.vim/undo    " where to save undo histories (dir must exist)
set undolevels=1000        " How many undos
set undoreload=10000       " number of lines to save for undo

" gundu keyboard mappings
nnoremap <leader>u :GundoToggle<CR>

" indentation settings
set expandtab      " enter spaces when tab is pressed
set tabstop=4      " an indentation every four columns
set softtabstop=4  " let backspace delete indent
set shiftwidth=4   " number of spaces to use for auto indent
set autoindent     " indent at the same level of the previous line

set nowrap             " wrap long lines
set pastetoggle=<F12>  " pastetoggle (sane indentation on pastes)

" make backspaces more powerfull
" set backspace=indent,eol,start

" Switch buffers
" note that I must first define what is <C-PageUp> for urxt
" http://cygwin.com/ml/cygwin-xfree/2006-07/msg00011.html
nmap    <ESC>[5^    <C-PageUp>
nmap    <ESC>[6^    <C-PageDown>
nnoremap <silent> <C-PageDown> :bnext<CR>
nnoremap <silent> <C-PageUp> :bprevious<CR>
