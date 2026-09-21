" source this file
map <C-s> :source ~/.vimrc<cr>

set encoding=UTF-8
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=100   " keep 100 lines of command line history
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set shiftwidth=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
set relativenumber " show relative line numbers to current line
set number " show line number
set cursorline " highlight current line
set cursorcolumn "highlight current column
set autoindent " always set autoindenting on
set lazyredraw " Don't redraw screen when running macros.
set splitbelow " Open splits below current pane
set splitright " Open vertical splits to the right of current pane
set scrolloff=10         "Start scrolling when we're 10 lines away from margins
set sidescrolloff=8
set autoread
set hlsearch " highlight search
" syntax enable
syntax on

" strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" when entering insert mode center the cursor
autocmd InsertEnter * norm zz

if (has('termguicolors'))
  set termguicolors
endif

" change the mapleader from \ to space
let mapleader=" "

" navigation re mappings
" Allow using ctrl-j k l h to navigate between window splits
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Better indenting
vnoremap < <gv
vnoremap > >gv

" shortcut for creating a new tab
nmap <Leader>tt :tabnew<cr>

" use tab to switch between tabs
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprev<CR>

nmap <leader>ru :exe "! bundle exec rubocop " . expand("%")<CR>
nmap <leader>ra :exe "! bundle exec rubocop -A " . expand("%")<CR>
