set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'plasticboy/vim-markdown'
Plugin 'nathanaelkane/vim-indent-guides'

" color schemes
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Automatically reload .vimrc file
autocmd! bufwritepost .vimrc source %

" Automatically remove all trailing whitespace
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * :%s/\s\+$//e

" line number
set nu

" smart indent
set smartindent

" highlight search matches
set hlsearch
" Remove highlight from last search
"noremap <C-b> :nohl<CR>
"vnoremap <C-b> :nohl<CR>
"inoremap <C-b> :nohl<CR>

" Toggle auto-indenting for code paste
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" Better copy & paste
set clipboard=unnamed

" hard tabstop
set tabstop=2

" soft tabstop
set softtabstop=2

" indent
set shiftwidth=2

" convert tab to space
set expandtab

" split windows
map <C-\> <C-W>v
map <C-_> <C-W>s
" move around the windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" easier moving between tabs
"map <Leader>n <esc>:tabprevious<CR>
"map <Leader>m <esc>:tabnext<CR>

" map Fix indentation to F7
"map <F7> mzgg=G`z<CR>

" map ESCAPE to a quick 'jk'
imap jk <ESC>

" Rebind <Leander> key (default = \)
let mapleader=","

" Quicksave
noremap <Leader>w :w<CR>
noremap <Leader>q :q!<CR>

" Easier indent/unindent code blocks
vnoremap < <gv
vnoremap > >gv

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" disable folding
set nofoldenable

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Indent guides
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" enable 256 colors
set t_Co=256
colorscheme inkpot

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_aggregate_errors = 0

" vim-airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set noshowmode
