" Vim settings

"-----------------------------------------
"General Settings
"-----------------------------------------
"set history lines vim is to remember
set history=300

"set mapleader
let mapleader = ";"
let g:mapleader = ";"

"auto read when files are changed
set autoread
set autowrite

"nmap <Space> :
imap jj <Esc>
"fast saving
nmap <Leader>w :w!<CR>
"fast editing vimrc
nmap <Leader>ev :e! ~/.vimrc<CR>

"insert current time
map <F6> <Esc>a<c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr><Esc>
"reload vimrc when it's edited
autocmd! bufwritepost vimrc source ~/.vimrc

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"--------------------------------------------------
"VIM user interface
"--------------------------------------------------

"set 7 lines to the cursors
set so=7
set wildmenu " turn on wild menu
set ruler		" show the cursor position all the time
set cmdheight=1
set hid "change buffer, without saving

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
set nobackup
set noswapfile
set nowb
set nocompatible
set noeb
set number		" show line number
set omnifunc=syntaxcomplete#Complete
set showcmd		" display incomplete commands
set go-=T
"set patchmode=.orig	"backup the original file with a ext name .orig
syntax on

"set dir to current
"set bsdir=buffer
"set autochdir

"set colorscheme
colo slate

"set encoding
set encoding=utf-8
set fileencodings=utf-8,cp936,gb18030,big5,latin-1
"set font
if has("win32")
	"set guifont=Courier_New:h10:cANSI
	"set guifont=Terminus:h12
	"set guifontwide=YaHei\ Consolas\ Hybrid:h9
	"set guifont=Yahei\ Consolas\ Hybrid:h10
	set fileencoding=chinese  
	au GUIEnter * simalt ~x
else
	set fileencoding=utf-8
	set guifont=DejaVu\ Sans\ Mono\ 10
endif
"set guifont=Terminus:h12

"set statusline
"set statusline=%f\ %m%r\ [%{strftime('%Y-%m-%d',getftime(expand('%')))}]%= 
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

"commands of fencview plugin
nmap <Leader>fa :FencAutoDetect<CR>
nmap <Leader>fv :FencView<CR>

"------------------------------------------
"About Plugins
"------------------------------------------
call pathogen#runtime_append_all_bundles()

"set Tag List Plugin
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_WinWidth=35
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
let g:calendar_diary="~/diary"
let g:calendar_navi='top'
let g:calendar_mark='right'
let g:cal_exit_onlywindow=1

"Template of diary
"autocmd BufNewFile *.txt read $vimruntime\templates\diary.tpl | normal ggdd


"---------------------------------------
"Other Settings
"---------------------------------------


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

if has('mouse')
  set mouse=a
endif

