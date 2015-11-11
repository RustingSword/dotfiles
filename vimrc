" Vim settings

" set shell if using fish
set shell=/bin/bash

"-----------------------------------------
" Using Vundle to manage all the plugins
"-----------------------------------------

set nocompatible " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'mattn/calendar-vim'
Bundle 'LanguageTool'
"Bundle 'minibufexpl.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'FencView.vim'
Bundle 'vimwiki'
"Bundle 'ledger/vim-ledger'
Bundle 'kien/ctrlp.vim'

" real-time syntax checking
Bundle 'scrooloose/syntastic'

Bundle 'bling/vim-airline'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'

" replace taglist
Bundle 'majutsushi/tagbar'
Bundle 'gerw/vim-latex-suite'

" integrate git into vim
Bundle 'tpope/vim-fugitive'

" colorlize matching parentheses
Bundle 'kien/rainbow_parentheses.vim'

" visualize undolist
Bundle 'sjl/gundo.vim.git'

" add/delete/change parentheses
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
" use ctrl-a ctrl-x to change date/time
Bundle 'tpope/vim-speeddating'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
"Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'lilydjwg/fcitx.vim'
Bundle 'matze/vim-move'
Bundle 'uguu-org/vim-matrix-screensaver'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'derekwyatt/vim-scala'
"-----------------------------------------
"General Settings
"-----------------------------------------

filetype plugin indent on
set nocompatible
syntax on
"set history lines vim is to remember
set history=1000

"set mapleader
let mapleader = ';'
let g:mapleader = ';'

"auto read when files are changed
set autoread
set autowrite

set nobackup
set noswapfile

" Some key maps
"
"insert current time
map <F6> <Esc>a<c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr><Esc>

"fast editing vimrc
nmap <Leader>ev :e $MYVIMRC<CR>

"reload vimrc when it's edited
autocmd! bufwritepost .vimrc source $MYVIMRC

nmap <Space> <c-f>

"--------------------------------------------------
"VIM user interface
"--------------------------------------------------
set t_Co=256

"set colorscheme
if(has('gui_running'))
    set guifont=Monaco
    colo zenburn
    hi Pmenu                    guibg=#606060
    hi PmenuSel                 guifg=#dddd00 guibg=#1f82cd
    hi PmenuSbar                guibg=#d6d6d6
    hi PmenuThumb               guifg=#3cac3c
else
    "colo torte
    colo slate
    highlight Pmenu ctermbg=8
    highlight PmenuSel ctermbg=1
    highlight PmenuSbar ctermbg=0
    " set the background color of ColorColumn to light grey
    hi ColorColumn ctermbg=238
endif

set showcmd		" display incomplete commands
set go-=T
"set 50 lines to the cursors to make the cursor always in the middle of the
"screen
set so=50
set wildmenu " turn on wild menu for command line completion
set ruler		" show the cursor position all the time
set cmdheight=1
set hid "change buffer, without saving
set number		" show line number

"set backspace config
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l

set hlsearch
set incsearch		" do incremental searching

set showmatch

"no sound on errors
set noerrorbells
"set novisualbell
set t_vb=
set novisualbell

"--------------------------------------------
"text, tab and indent related
"--------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

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
"set patchmode=.orig	"backup the original file with a ext name .orig

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

"------------------------------------------
"Editing
"------------------------------------------
" Uncomment the following to have Vim jump to the last position when 
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif

inoremap <c-e> <Esc>A
inoremap <c-a> <Esc>I

"------------------------------------------
"About Plugins
"------------------------------------------

" AirLine
" let g:airline_theme='badwolf'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

"commands of fencview plugin
nmap <Leader>fa :FencAutoDetect<CR>
nmap <Leader>fv :FencView<CR>

" set TagBar
map <Leader>tt :TagbarToggle<CR>
let g:tagbar_sort=0 "sort the tags according to their order in the source file
let g:tagbar_width=32
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsalways_use_first_snippet = 1
" set Gundo
nmap <Leader>u :GundoToggle<CR>

"set NERDTree

map <Leader>nt :NERDTreeToggle<CR>
let g:NERDTreeWinSize=32

"set LaTeX-Suit
set shellslash
let g:tex_flavor='latex'
"set sw=2
set iskeyword-=:,_

" translate the word under cursor
function! SearchWord()
    let expr = '!ydcv -s ' .expand("<cword>")
    exec expr
endfunction

" translate selected text
function! SearchWord_v(type, ...)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    if a:0
        silent exe "normal! `<" . a:type . "`>y"
    elseif a:type == 'line'
        silent exe "normal! '[V']y"
    elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]y"
    else
        silent exe "normal! `[v`]y"
    endif

    let word = @@
    let expr = '!ydcv -s "' . word . '"'
    exec expr

    let &selection = sel_save
    let @@ = reg_save
endfunction

nnoremap <Leader>d :call SearchWord()<CR>
vnoremap <Leader>d :<C-U>call SearchWord_v(visualmode(), 1)<cr>

" forward search for tex files
function! SyncTexForward()
    let s:syncfile = fnamemodify(fnameescape(Tex_GetMainFileName()), ":r").".pdf"
    let execstr = "silent !okular --unique ".s:syncfile."\\#src:".line(".").expand("%\:p").' &'
    exec execstr
endfunction
nmap <Leader>f :call SyncTexForward()<CR>

"set SuperTab
"let g:SuperTabRetainCompletionType=2

"set MiniBufExplorer
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1

"set Calendar
let g:calendar_navi='top'
let g:calendar_mark='right'
let g:cal_exit_onlywindow=1

"integrate calendar with vimwiki
let g:vimwiki_use_calendar=1
nmap <Leader>vd :VimwikiToggleListItem<CR>

"set LanguageTool
let g:languagetool_jar='~/.langcheck/languagetool-commandline.jar'

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

" Neocomplete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"---------------------------------------
"Other Settings
"---------------------------------------
