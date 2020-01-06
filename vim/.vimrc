set relativenumber
set number

set bs=2
set incsearch

set nrformats+=alpha

syntax on
colorscheme sublimemonokai

" set the leader key to ","
let mapleader = ","
" set a key command for NERDTree
" ,n
nmap <leader>m : NERDTreeToggle<cr>

" set ctrl-hjkl to move around splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" highlight beyond 80 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'triglav/vim-visual-increment'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'

call plug#end()
