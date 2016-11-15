" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins
" =======
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'Chiel92/vim-autoformat'
Plugin 'gioele/vim-autoswap'

" indent guides
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" js
"Plugin 'ternjs/tern_for_vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'

Plugin 'Raimondi/delimitMate'

" snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" (optional)
Plugin 'honza/vim-snippets'

" css
Plugin 'skammer/vim-css-color'

" jade
Plugin 'digitaltoad/vim-pug'

" ejs
Plugin 'briancollins/vim-jst'

" html/xml
Plugin 'docunext/closetag.vim'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" emmet
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'

" proselint
"Plugin 'amperser/proselint'

" typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'

" tmux
Plugin 'wellle/tmux-complete.vim'
Plugin 'jmcantrell/vim-virtualenv'

" PowerShell
Plugin 'PProvost/vim-ps1'

" json
Plugin 'elzr/vim-json'

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
fun! StripTrailingWhitespace()
  " Only strip if the b:noStripeWhitespace variable isn't set
  if exists('b:noStripWhitespace')
      return
  endif
  %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType markdown let b:noStripWhitespace=1



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

"set mouse=a                         " set mouse support for all modes

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
" <F2>: toggle auto indenting for code paste
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

autocmd FileType python set tabstop=4|set softtabstop=4|set shiftwidth=4


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
set foldmethod=indent                 " fold based on indent
set foldnestmax=10                    " deepest fold is 10 levels
set nofoldenable                      " don't fold by default
set foldlevel=1



" Tabs (viewports)
" ================
" maximum of tabs
set tabpagemax=32



" vim-indent-guides
" =================
"let g:indent_guides_auto_colors=0
"hi IndentGuidesOdd ctermbg=238
"hi IndentGuidesEven ctermbg=236
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1



" indentLine
let g:vim_json_syntax_conceal = 0
let g:indentLine_noConcealCursor = ''


" syntastic
" =========
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['python', 'pylint']
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_html_checkers = ['eslint']

" disable syntastic by default
autocmd VimEnter * SyntasticToggleMode



" vim-airline
" ===========
function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode',' ','branch'])
  let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
  let g:airline_section_c = airline#section#create(['filetype'])
  let g:airline_section_x = airline#section#create(['%P'])
  let g:airline_section_y = airline#section#create(['%B'])
  let g:airline_section_z = airline#section#create_right(['%l','%c'])
endfunction
autocmd VimEnter * call AirlineInit()

" enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" show only filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts=1



" YouCompleteMe
" =============
let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_confirm_extra_conf = 0
"set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = 'python3'



" vim-markdown
" ============
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0



" NERDTree
" ========
" map a specific shortcut key to open NERDTree (default <C-n>)
map <C-t> :NERDTreeToggle<CR>

" change default arrow symbols
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" open a NERDTree automatically when vim starts up & no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



" ctrlp
" =====
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|bower_components|\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }
let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']



" closetag.vim
" ============
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim



" autoformat
let g:formatdef_custom_html = '"js-beautify --type html --indent-size=2 --preserve-newlines --wrap-line-length=80 --wrap-attributes=force --wrap-attributes-indent-size=4"'
let g:formatters_html = ['custom_html']



" javascript-libraries-syntax.vim
" ===============================
let g:used_javascript_libs = 'underscore,angularjs,jasmine'



" delimitMate
" ===========
let delimitMate_expand_cr = 1



" tern-for-vim
"let g:tern_show_argument_hints='onhold'
"let g:tern_map_keys=1



" tmux-complete.vim
" =================
let g:tmuxcomplete#trigger = 'omnifunc'



" emmet.vim
" =========
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:user_emmet_leader_key='<C-l>'
let g:user_emmet_settings = webapi#json#decode(
  \ join(readfile(expand('~/.snippets.json')), "\n"))
" https://coderwall.com/p/_uhrxw/using-tab-key-as-abbreviation-expander-on-emmet-vim
" use <tab> as abbreviation expander
"let g:user_emmet_expandabbr_key='<tab>'
"imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")



" Filetypes
" =========
"au BufNewFile,BufRead *.ejs set filetype=html



" Shortcut keys
" =============
" remove highlight from last search
noremap <Leader>l :nohl<CR>
vnoremap <Leader>l :nohl<CR>
inoremap <Leader>l :nohl<CR>

" buffers
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>q :bw<CR>
nmap <Leader>bb :ls<CR>:buffer<Space>

" split windows
map <C-\> <C-W>v
map <C--> <C-W>s
" move around the windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" search and replace the all word(s) under the cursor in current buffer
" http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor
noremap <Leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" search and replace selected text
" http://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text
vnoremap <Leader>r "hy:%s/<C-r>h//gc<left><left><left>

" toggle syntastic mode
nnoremap <F3> :SyntasticToggleMode<CR>

" activate syntastic check
nnoremap <F4> :SyntasticCheck<CR>

" toggle spell check
map <F5> :setlocal spell! spelllang=en_us<CR>

" fix indentation
"map <F7> mzgg=G`z<CR>
map <F7> :Autoformat<CR>

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
