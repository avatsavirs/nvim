call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'sheerun/vim-polyglot'
    Plug 'morhetz/gruvbox'
    Plug 'bluz71/vim-nightfly-guicolors'
    Plug 'arcticicestudio/nord-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'wincent/loupe'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-rooter'
    Plug 'tpope/vim-abolish'
    Plug 'rust-lang/rust.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
call plug#end()
