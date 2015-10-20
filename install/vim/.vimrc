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
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flazz/vim-colorschemes'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'

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



" General config
" ==============
set number                          " show line number (nu)
set autoread                        " Reload files changed outside vim
set clipboard=unnamedplus           " use system clipboard
set showmode                        " show current mode down the bottom
set hidden                          " buffers can exist in the background
set laststatus=2                    " always show status line
set history=999                     " store more :cmdline history

set ignorecase                      " case-INsensitive search
set smartcase                       " case-sensitive search when using a capital letter

set mouse=a                         " set mouse support for all modes

set splitright                      " open vertical split right of current window
set splitbelow                      " open horizontal split below of current window



" Shortcut keys
" =============
" map ESCAPE to a quick 'jk'
imap jk <ESC>

" rebind <Leander> key (default = \)
let mapleader=","


" Swap, backup, undo directories
" ==============================
set directory=~/.vim/swap//

set backupdir=~/.vim/backup//
" Double slash does not actually work for backupdir, here's a fix
au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'), ':', '', 'g')
set backup

set undodir=~/.vim/undo//
set undofile



" Search settings
" ==============
set incsearch                       " find the next match as typing
set hlsearch                        " highlight search matches

" toggle auto-indenting for code paste
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>



" Indentation
" ===========
set autoindent
set smartindent
set smarttab

set tabstop=2                         " hard tabstop
set softtabstop=2                     " soft tabstop
set shiftwidth=2                      " indent
set expandtab                         " convert tab to space



" Display
" =======
set colorcolumn=80                    " column-80 vertical line
set linebreak                         " wrap lines at convenient points
set listchars=tab:▸\ ,eol:¬,trail:·

" toggle revealing hidden characters
noremap <Leader>s :set list!<CR>



" Colorscheme
" ===========
syntax enable
let g:hybrid_use_Xresources=1
colorscheme wombat256i
set background=dark
hi Search cterm=NONE ctermfg=grey ctermbg=red
let g:rehash256 = 1



" Folding
" =======
set nofoldenable                    " disable folding
"set foldmethod=indent              " fold based on indent
"set foldnestmax=3                  " deepest fold is 3 levels



" Tabs (viewports)
" ================
" maximum of tabs
set tabpagemax=32



" vim-indent-guides
" =================
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1



" syntastic
" =========
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['pep8']
"let g:syntastic_python_pylint_args = '--disable=C0325'
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height = 8



" vim-airline
" ===========
" enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" show only filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_font=0



" YouCompleteMe
" =============
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1



" NERDTree
" ========
" map a specific shortcut key to open NERDTree (default <C-n>)
map <C-t> :NERDTreeToggle<CR>

" change default arrow symbols
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" open a NERDTree automatically when vim starts up & no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



" ctrlp
" =====
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }



" Shortcut keys
" =============
" remove highlight from last search
noremap <Leader>n :nohl<CR>
vnoremap <Leader>n :nohl<CR>
inoremap <Leader>n :nohl<CR>

" buffers
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>q :bd<CR>

" split windows
map <C-\> <C-W>v
map <C-_> <C-W>s
" move around the windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" <F2>: toggle auto indenting for code paste

" toggle syntastic mode
nnoremap <F3> :SyntasticToggleMode<CR>

" activate syntastic check
nnoremap <F4> :SyntasticCheck<CR>

" fix indentation
map <F7> mzgg=G`z<CR>

" quicksave
noremap <Leader>w :w<CR>
noremap <Leader>z :q<CR>

" easier indent/unindent code blocks
vnoremap < <gv
vnoremap > >gv

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk
