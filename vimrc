" Vim settings

"-----------------------------------------
"General Settings
"-----------------------------------------

set nocompatible
syntax on
"set history lines vim is to remember
set history=300

"set mapleader
let mapleader = ";"
let g:mapleader = ";"

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
autocmd! bufwritepost vimrc source $MYVIMRC

nmap <Space> <c-f>

"--------------------------------------------------
"VIM user interface
"--------------------------------------------------

"set colorscheme
colo slate

set showcmd		" display incomplete commands
set go-=T
"set 7 lines to the cursors
set so=7
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
set vb

"--------------------------------------------
"text, tab and indent related
"--------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai " auto indent
set si " smart indent
set ambiwidth=double
set cindent
set nowb
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
	set guifont=Monaco\ 12
endif

"set statusline
"via http://www.douban.com/group/topic/15580471/
set laststatus=2
"" 状态栏各个状态
let statusHead ="%-.50f\ %h%m%r"
let statusBreakPoint ="%<"
let statusSeparator ="|"
let statusFileType ="%{((&ft\ ==\ \"help\"\ \|\|\ &ft\ ==\ \"\")?\"\":\"[\".&ft.\"]\")}"
let statusFileFormat ="[%{(&ff\ ==\ \"unix\")?\"u\":\"d\"}]"
let statusAscii ="\{%b:0x%B\}"
let statusCwd ="%-.50{getcwd()}"
let statusBody =statusFileType.statusFileFormat.statusSeparator.statusAscii.statusSeparator."\ ".statusBreakPoint.statusCwd
let statusEncoding ="[%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]"
let statusBlank ="%="
let statusKeymap ="%k"
let statusRuler ="%-12.(%lL,%c%VC%)\ %P"
let statusTime ="%{strftime(\"%Y-%m-%d\",getftime(expand(\"%\")))}"
let statusEnd=statusKeymap."\ ".statusEncoding.statusRuler."\ ".statusTime
"" 最终状态栏的模式字符串
let statusString=statusHead.statusBody.statusBlank.statusEnd
set statusline=%!statusString 

" Encoding related
"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
  
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8


"------------------------------------------
"About Plugins
"------------------------------------------

"commands of fencview plugin
nmap <Leader>fa :FencAutoDetect<CR>
nmap <Leader>fv :FencView<CR>

"set Tag List Plugin
let Tlist_Use_Right_Window=1
"let Tlist_File_Fold_Auto_Close=1
"let Tlist_WinWidth=35
let Tlist_Exit_OnlyWindow=1
map <Leader>tl :TlistOpen<CR>

"set NERDTree

map <Leader>nt :NERDTree<CR>

"set LaTeX-Suit
filetype plugin indent on
set shellslash
let g:tex_flavor='latex'
"set sw=2
set iskeyword+=:

"set SuperTab
let g:SuperTabRetainCompletionType=2

"set MiniBufExplorer
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplMapWindowNavVim = 1 

"set Calendar
map <Leader>ca :Calendar<CR>
"let g:calendar_diary="~/diary"
let g:calendar_navi='top'
let g:calendar_mark='right'
let g:cal_exit_onlywindow=1

"set LanguageTool
let g:languagetool_jar='~/.langcheck/LanguageTool.jar'

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

"Template of diary
"autocmd BufNewFile *.txt read $vimruntime\templates\diary.tpl | normal ggdd


"---------------------------------------
"Other Settings
"---------------------------------------
