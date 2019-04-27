" Vim settings

" auto install vim-plug
" see: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" {{{ Using vim-plug to manage all the plugins
call plug#begin('~/.vim/bundle')
Plug 'nacitar/a.vim'
Plug 'rhysd/vim-clang-format'
Plug 'fholgado/minibufexpl.vim'
Plug 'mbbill/fencview'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-speeddating'
Plug 'schickling/vim-bufonly'

" wiki and diary
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

" color schemes
Plug 'flazz/vim-colorschemes'

Plug 'bling/vim-airline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" replace taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" visualize undolist
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }

" add/delete/change parentheses
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'

Plug 'honza/vim-snippets'
Plug 'Shougo/neocomplete.vim'
Plug 'rust-lang/rust.vim'
Plug 'mhinz/vim-signify'

" compile
Plug 'skywind3000/asyncrun.vim'

" syntastic check
Plug 'w0rp/ale'
call plug#end()
" }}}

" {{{ General Settings

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
set nosmd       " don't show current mode (we use airline already)

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

" AirLine
" let g:airline_theme='badwolf'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

"commands of fencview plugin
nmap <Leader>fa :FencAutoDetect<CR>
nmap <Leader>fv :FencView<CR>

" set TagBar
map <Leader>tt :TagbarToggle<CR>
let g:tagbar_sort=0 "sort the tags according to their order in the source file
let g:tagbar_width=32
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py call tagbar#autoopen()

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

" vimwiki
nnoremap <Leader><Space> :VimwikiToggleListItem<cr>

" AsyncRun
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" ALE
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

" }}}
" {{{ Other settings
" }}}
" vim: fdm=marker
