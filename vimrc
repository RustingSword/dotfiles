" Vim settings

" set shell if using fish
set shell=/bin/bash

" {{{ Using Vundle to manage all the plugins

set nocompatible " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'rhysd/vim-clang-format'
Bundle 'gmarik/vundle'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'fencview.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-speeddating'
Bundle 'BufOnly.vim'

" wiki and diary
Bundle 'vimwiki/vimwiki'
Bundle 'mattn/calendar-vim'

" color schemes
Bundle 'flazz/vim-colorschemes'

" real-time syntax checking
Bundle 'scrooloose/syntastic'

Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'

" replace taglist
Bundle 'majutsushi/tagbar'

" visualize undolist
Bundle 'sjl/gundo.vim.git'

" add/delete/change parentheses
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'

Bundle 'honza/vim-snippets'
Bundle 'Shougo/neocomplete.vim'
Bundle 'rust-lang/rust.vim'
Bundle 'airblade/vim-gitgutter'
" }}}
" {{{ General Settings

filetype plugin indent on
set nocompatible
syntax on
"set history lines vim is to remember
set history=10000

"set mapleader
let mapleader = ';'
let maplocalleader = ';'
let g:mapleader = ';'

"auto read when files are changed
set autoread
set autowrite

set nobackup
set noswapfile

" Some key maps
"
"insert current time
"map <F6> <Esc>a<c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr><Esc>

"fast editing vimrc
nmap <Leader>ev :e $MYVIMRC<CR>

"reload vimrc when it's edited
autocmd! bufwritepost .vimrc source $MYVIMRC

nmap <Space> <c-f>
" }}}
" {{{ VIM user interface
set t_Co=256

"set colorscheme
if(has('gui_running'))
    set guifont=Source\ Code\ Pro:h14
    colorscheme solarized
    "hi Pmenu                    guibg=#606060
    "hi PmenuSel                 guifg=#dddd00 guibg=#1f82cd
    "hi PmenuSbar                guibg=#d6d6d6
    "hi PmenuThumb               guifg=#3cac3c
else
    "colo torte
    colo slate
    highlight Pmenu ctermbg=8
    highlight PmenuSel ctermbg=1
    highlight PmenuSbar ctermbg=0
    hi Search ctermfg=gray ctermbg=18
    " set the background color of ColorColumn to light grey
    hi ColorColumn ctermbg=238
endif

set showcmd     " display incomplete commands
"set 100 lines to the cursors to make the cursor always in the middle of the
"screen
set so=100
set wildmenu " turn on wild menu for command line completion
set ruler       " show the cursor position all the time
set cmdheight=1
set hid "change buffer, without saving
set number      " show line number

"set backspace config
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l

set hlsearch
set incsearch       " do incremental searching

set showmatch

"no sound on errors
set noerrorbells
"set novisualbell
set t_vb=
set novisualbell
" }}}
" {{{ text, tab and indent related

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set list
set listchars=tab:>-,trail:-

set lbr
set textwidth=80

" Also break at a multi-byte character above 255, and don't insert a space
" before or after a multi-byte character when joining lines
set formatoptions+=mM

"highlight overlength
set colorcolumn=+1 " highlight column 81 (#textwidth+1)

set ai " auto indent
set si " smart indent
set ambiwidth=double
set cindent
set nowb " no write backup
set omnifunc=syntaxcomplete#Complete

"set dir to current
"set bsdir=buffer
"set autochdir

"set encoding
set encoding=utf-8
set fileencodings=utf-8,cp936,gb18030,big5,latin-1
"set font
if has("win32")
    "set guifont=Courier_New:h10:cANSI
    "set guifont=Terminus:h12
    "set guifontwide=YaHei\ Consolas\ Hybrid:h9
    "set guifont=Yahei\ Consolas\ Hybrid:h10
    "set fileencoding=chinese
    au GUIEnter * simalt ~x
else
    set guifont=Monaco:h12
endif

"set statusline
set laststatus=2

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
" }}}
" {{{ Editing
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g`\"" | endif
endif

inoremap <c-e> <Esc>A
inoremap <c-a> <Esc>I

nnoremap n nzz
nnoremap N Nzz

au bufreadpost *.txt set complete+=k dictionary=/usr/share/dict/words
au bufnewfile *.txt set complete+=k dictionary=/usr/share/dict/words
" }}}
" {{{ Plugin setup

" GitGutter
nmap <leader>gv :GitGutterPreviewHunk<CR>
nmap <leader>gu :GitGutterUndoHunk<CR>
nmap <leader>gn :GitGutterNextHunk<CR>
nmap <leader>gp :GitGutterPrevHunk<CR>"

" AirLine
" let g:airline_theme='badwolf'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_powerline_fonts = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

let g:syntastic_mode_map = {'mode' : 'passive', 'active_filetypes' : [], 'passive_filetypes' : []}
nnoremap <Leader>st :SyntasticToggleMode<CR>

"commands of fencview plugin
nmap <Leader>fa :FencAutoDetect<CR>
nmap <Leader>fv :FencView<CR>

" set TagBar
map <Leader>tt :TagbarToggle<CR>
let g:tagbar_sort=0 "sort the tags according to their order in the source file
let g:tagbar_width=32
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py call tagbar#autoopen()

" set Vim Clang Formatter
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" set Gundo
nmap <Leader>u :GundoToggle<CR>

"set NERDTree
map <Leader>nt :NERDTreeToggle<CR>
let g:NERDTreeWinSize=32

"set MiniBufExplorer
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs kill -1
        cs add cscope.out
        " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" }}}
" {{{ Other settings
" }}}
" vim: fdm=marker
