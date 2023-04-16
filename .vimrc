" ==== Custom stuff ====
set number
set tabstop=4
set softtabstop=4
set mouse=a
set splitright
set hlsearch
set showcmd 

" ==== Run on start ====
autocmd VimEnter * NERDTree
au VimEnter * wincmd l
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


set nocompatible              " be iMproved, required
filetype off                  " required

command -nargs=0 Vt vert terminal
command -nargs=0 Hex %!xxd

" ---- Fuzzy file search
set path+=**  " tab completion
set wildmenu  " display all matching files

" ---- Shortcuts
nnoremap ,java :-1read ~/.vim_custom/temp.java<CR>wi

inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O


" ==== Plugin managers ==== 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Custom Plugin path
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/tagbar'

Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'catppuccin/vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" see :h vundle for more details 


" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
"Plug 'tpope/vim-sensible'
"Plug 'https://github.com/Shougo/deoplete.nvim.git'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ==== Color Scheme ====
" One dark
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme onedark

" Palenight
"set background=dark
"colorscheme palenight

