" Vundle
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

""" End of Vundle config

" Run a command after any file is saved
"autocmd BufWritePost * !<command> <file>

" Automatically reload .vimrc file
" http://vim.wikia.com/wiki/Change_vimrc_with_auto_reload
autocmd! bufwritepost .vimrc source %

" Automatically remove all trailing whitespace
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * :%s/\s\+$//e

" Rebind <Leander> key (default = \)
let mapleader=","


" Swap, backup, undo directories
set directory=~/.vim/swap//

set backupdir=~/.vim/backup//
" Double slash does not actually work for backupdir, here's a fix
au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'), ':', '', 'g')
set backup

set undodir=~/.vim/undo//
set undofile


" line number
set nu

" column-80 vertical line
set colorcolumn=80

set ignorecase
" case-sensitive search when using a capital letter
set smartcase

" highlight search matches
set hlsearch
" Remove highlight from last search
noremap <Leader>l :nohl<CR>
vnoremap <Leader>l :nohl<CR>
inoremap <Leader>l :nohl<CR>

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

" Quicksave
noremap <Leader>w :w<CR>
noremap <Leader>z :q!<CR>

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
colorscheme wombat256i

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_pylint_args = '--disable=C0325'
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height = 8

nnoremap <F3> :SyntasticToggleMode<CR>
nnoremap <F4> :SyntasticCheck<CR>

" vim-airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set noshowmode


" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
