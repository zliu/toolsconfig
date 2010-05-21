""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic VIM settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode.
set nocompatible

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

set nocp
syntax on

""""""""""""""""""""""""""""""""""""""""
"设置缩进
set ai                              "autoindent(ai)
set cindent                         "C语言缩进
set shiftwidth=4                    "设置缩进长度(sw)
set tabstop=4                       "设置tab长度(ts)
set expandtab                       "设置空格替代tab
set smarttab                        "行首tab的四个空格可以整个删除
set smartindent

set number
colorscheme elflord
set clipboard+=unnamed
set report=0
set formatoptions=tcrqn
set incsearch
set foldenable
" Display underline on current line
"set cursorline 
" Display invisible space charactors
"set invlist 

""""""""""""""""""""""""""""""""""""""""
" 设置语言
set encoding=utf-8
set termencoding=utf-8
"set fileencoding=chinese
set fileencodings=utf-8,gbk,ucs-bom,chinese 
let &termencoding=&encoding

""""""""""""""""""""""""""""""""""""""""
" 非xterm终端下退出vim可以restorescreen
if &term != "xterm"
    " SecureCRT versions prior to 6.1.x do not support 4-digit DECSET
    "     let &t_ti = "\<Esc>[?1049h"
    "     let &t_te = "\<Esc>[?1049l"
    " Use 2-digit DECSET instead
    let &t_ti = "\<Esc>[?47h"
    let &t_te = "\<Esc>[?47l"
endif

set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
map <silent> <C-v> :vsp<CR>

""""""""""""""""""""""""""""""""""""""""
"  switch wrap mode
let g:wrapmode=1
nmap <silent> <F4> :call ToggleWrapMode()<CR>
function ToggleWrapMode()
if g:wrapmode == 0
    set wrap
    let g:wrapmode=1
else
    set nowrap
    let g:wrapmode=0
endif
endfunction


""""""""""""""""""""""""""""""""""""""""
" => Set mapleader
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast loading .vimrc file
nmap <leader>l :vi ~/.vimrc<cr>

" Fast loading .vimrc file
nmap <leader>s :source ~/.vimrc<cr>


""""""""""""""""""""""""""""""""""""""""
"  key shortcuts for save
imap <C-r> <ESC>:e<CR>a
nmap <C-r> :e<CR>
imap <C-a> <ESC>:wa<CR>a
nmap <C-a> :wa<CR>

""""""""""""""""""""""""""""""""""""""""
"  Enable mouse functionality
"set mouse=a

""""""""""""""""""""""""""""""""""""""""
"  Tab View
map  <C-e> :tabprevious<CR>
map  <C-r> :tabnext<CR>
map  <C-t> :tabnew<CR>
map  <C-y> :tabclose<CR>
imap  <C-e> <ESC>:tabprevious<CR>i
imap  <C-r> <ESC>:tabnext<CR>i
imap  <C-t> <ESC>:tabnew<CR>i

""""""""""""""""""""""""""""""""""""""""
"  Auto Pair for parentheses, square brackets and curly braces
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap { {<CR>}<ESC>kA<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
" 首次输入{自动匹配输入了}之后，敲回车自动将}下移一行
" 将输入光标置到{所在行和}所在行的中间
inoremap <CR> <c-r>=AutoNewLine('}')<CR>

function ClosePair(char)
if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
    else
        return a:char
endif
endf

function AutoNewLine(char)
if getline('.')[col('.') - 1] == a:char
    return "\<CR>\<ESC>ko"
else
    return "\<CR>"
endif
endf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings

""""""""""""""""""""""""""""""""""""""""
" NERDcomment setting
let NERDSpaceDelims=1 "insert a space between '/*' and '*/'
""""""""""""""""""""""""""""""""""""""""
" Taglist shortcuts
map <silent> <F12> :TlistToggle<cr>
let Tlist_Show_One_File = 0            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
let Tlist_WinWidth = 35                "taglist窗口宽度 
let Tlist_Auto_Update = 1              "自动更新tag列表
let Tlist_File_Fold_Auto_Close = 1     "自动折叠非活动文件的tag列表

""""""""""""""""""""""""""""""""""""""""
" netrw setting
let g:netrw_winsize = 30
nmap <silent> <F6> :Sexplore!<cr> 

""""""""""""""""""""""""""""""""""""""""
" FuzzyFinder setting
nmap <silent> <F5> :FufFile<cr>

""""""""""""""""""""""""""""""""""""""""
" lookupfile setting
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")                "设置tag文件的名字
let g:LookupFile_TagExpr = '"./filenametags"'
endif
"映射LookupFile为,lk
"nmap <silent> <leader>lk <Plug>LookupFile<cr>
"映射LUBufs为,ll
"nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
"nmap <silent> <leader>lw :LUWalk<cr>

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry

    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc' 
