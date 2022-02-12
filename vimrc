" source the init.vim for neovim shortcut
map <C-s> :source ~/.config/nvim/init.vim<cr>

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
set et
set sw=2 " sw = shift width
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
set relativenumber " show relative line numbers to current line
set number " show line number
set cursorline " highlight current line
set cursorcolumn "highlight current column
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on
set lazyredraw " Don't redraw screen when running macros.
set splitbelow " Open splits below current pane
set splitright " Open vertical splits to the right of current pane
set scrolloff=10         "Start scrolling when we're 10 lines away from margins
set sidescrolloff=8
set guifont=Menlo:h10
set autoread
set hlsearch " highlight search
" syntax enable
syntax on


" strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" when entering insert mode center the cursor
autocmd InsertEnter * norm zz

call plug#begin()
" themes + status bar
Plug 'vim-airline/vim-airline'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'sickill/vim-monokai'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'preservim/nerdtree'
" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" ruby + rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-test/vim-test'
" elm
Plug 'elmcast/elm-vim'
" searching and files
Plug 'jremmen/vim-ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'pechorin/any-jump.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-telescope/telescope.nvim'
" Utilities
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ervandew/supertab'
call plug#end()

if (has('termguicolors'))
  set termguicolors
endif

colorscheme monokai
let g:airline_theme='monokai_tasty'

" change the mapleader from \ to space
let mapleader=" "

" my leader mappings to specific files to open in a new tab
map <Leader>ro :tabnew config/routes.rb<cr>
map <Leader>sc :tabnew db/schema.rb<cr>
map <Leader>ac :sp app/controllers/application_controller.rb<cr>

" leader commands by Plugin
"
" Sideways
map <Leader>sl :SidewaysLeft<cr>
map <Leader>sr :SidewaysRight<cr>

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

" shortcut for toggling NERDTree
nmap <Leader>nt :NERDTreeToggle<CR>

" shortcut to delete current file and close buffer
nmap <Leader>dcf<CR>

" use tab to switch between tabs
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprev<CR>

map <Leader>s :TestNearest<CR>
map <Leader>t :TestFile<CR>
map <Leader>a :TestSuite<CR>
map <Leader>l :TestLast<CR>
map <Leader>v :TestVisit<CR>
nmap <Leader>rs :exe "! bundle exec rspec -fd" . expand("%")<CR>

nmap <leader>ru :exe "! bundle exec rubocop " . expand("%")<CR>
nmap <leader>ra :exe "! bundle exec rubocop -A " . expand("%")<CR>

" FZF leader shortcut
nmap <Leader>f :Files<CR>
" nmap <Leader>rg :Rg<CR>
nmap <Leader>rg :Telescope live_grep<CR>

" vim git stuff
nmap <leader>gs :G<CR>
nmap <leader>gd :Git diff<CR>
nmap <leader>gb :Git blame<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

" any jump
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.8
" anyjump background colour
hi Pmenu guibg=#1b1b1b ctermbg=Black
