"theme
set termguicolors
colorscheme nord
"Support 256 colors
set t_Co=256

"set leader key
let g:mapleader = "\<Space>" 

"set encoding
set encoding=utf-8

"Enable syntax highlighting
syntax enable

"Wrapping
set wrap
set linebreak

"Treat hyphen seperated words as a single word
set iskeyword+=-

"Disable autocomment on line change
au FileType * set fo-=c fo-=r fo-=o

"Highlight current line
set cursorline

"Use wildmenu
set wildmenu
  
"Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent

"Backup
set noswapfile
set nobackup
set nowritebackup

"Undo history
set undodir=~/.config/nvim/undohistory
set undofile

"Get line numbers
set number
set relativenumber

"Open new split on right by default
set splitright

"Search
set hlsearch 
set ignorecase
set smartcase
set incsearch

"Ask to save changes
set confirm

"Hide buffers instead of closing
set hidden

"Set default sessions directory
let g:sessions_dir = '~/.config/nvim/sessions'

"dots for whitespaces
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

