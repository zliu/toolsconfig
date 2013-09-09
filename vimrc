" Call pathogen plugin first
call pathogen#infect()
call pathogen#helptags()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic VIM settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode.
set nocompatible
" set backspace=indent,eol,start
set laststatus=2   " Always show the statusline
syntax on
" Enable filetype plugin
filetype plugin indent on
set t_Co=256
" share clipborad with system
set clipboard+=unnamed
"set report=0
"set formatoptions=tcrqn
"set foldenable
"set foldmethod=indent

colorscheme elflord
" breeze candycode dante darkblue Chocolateliquor
" Set to auto read when a file is changed from the outside
" set autoread

""""""""""""""""""""""""""""""""""""""""
"设置缩进
set ai                              "autoindent(ai)
set cindent                         "C语言缩进
set shiftwidth=4                    "设置缩进长度(sw)
set tabstop=4                       "设置tab长度(ts)
"set bs=2                           "在insert模式下用退格键删除
"set showmatch                      "代码匹配
set expandtab                       "设置空格替代tab
set smarttab                        "行首tab的四个空格可以整个删除
set smartindent
"set foldmethod=syntax

set number
set incsearch
set hlsearch

"set cursorline  " Display underline on current line
"set invlist     " Display invisible space charactors

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
""""""""""""""""""""""""""""""""""""""""
"  switch wrap mode
let g:wrapmode=1
nmap <silent> <F4> :call ToggleWrapMode()<CR>
function! ToggleWrapMode()
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
nmap <leader>l :vsp ~/.vimrc<cr>

" Fast loading .vimrc file
nmap <leader>rl :source ~/.vimrc<cr>

" Open Expolor in current window
nmap <leader>e :Explore<cr>

"Split
map <silent> <C-v> :vsp<CR>
map <silent> <C-s> :sp<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
"imap <C-h> <esc><C-w>h
"imap <C-j> <esc><C-w>j
"imap <C-k> <esc><C-w>k
"imap <C-l> <esc><C-w>l
nmap <silent> [ :vertical res -5<CR>
nmap <silent> ] :vertical res +5<CR>
"nmap <silent> [ <c-w><
"nmap <silent> ] <c-w>>
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
nmap <silent> - :res -1<CR>
nmap <silent> _ :res +1<CR>
nmap <leader>hm <C-w>_
nmap <leader>vm <C-w>\|
nmap <leader>q <C-w>=
"  key shortcuts for save
imap <C-r> <ESC>:e<CR>a
nmap <C-r> :e<CR>
imap <C-a> <ESC>:wa<CR>a
nmap <C-a> :wa<CR>
""""""""""""""""""""""""""""""""""""""""
"  Tab View
map  <C-e> :tabprevious<CR>
map  <C-r> :tabnext<CR>
map  <C-t> :tabnew<CR>:Explore<cr>
map  <C-y> :tabclose<CR>
imap  <C-e> <ESC>:tabprevious<CR>i
imap  <C-r> <ESC>:tabnext<CR>i
imap  <C-t> <ESC>:tabnew<CR>:Explore<cr>i

""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
"  Enable mouse functionality
"set mouse=a



"===============================================================================
" Plugin settings {{

""""""""""""""""""""""""""""""""""""""""
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
" Multi-Color Marker
let g:mwDefaultHighlightingPalette = 'extended' "switch to a richer palette of up to 18 colors
" | There are no default mappings for toggling all marks and for the :MarkClear 
" | command, but you can define some yourself: 
nmap <Leader>M <Plug>MarkToggle
nmap <Leader>N <Plug>MarkAllClear
" | To remove the default overriding of * and #, use: 
"nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext 
"nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev

""""""""""""""""""""""""""""""""""""""""
" NERDcomment setting
" let NERDSpaceDelims=1 "insert a space between '/*' and '*/'
nmap <C-c> <Plug>NERDCommenterInsert
let NERD_cpp_alt_style=1
let NERDAllowAnyVisualDelims=1
""""""""""""""""""""""""""""""""""""""""
" Vim-Indent-Guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
set ts=4 sw=2 et

map <Leader>ch :call SetColorColumn()<CR>
function! SetColorColumn()
  let col_num = virtcol(".")
  let cc_list = split(&cc, ',')
  if count(cc_list, string(col_num)) <= 0
    execute "set cc+=".col_num
  else
    execute "set cc-=".col_num
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""
" grep
nnoremap <silent> <F3> :Rgrep<CR>
let Grep_Skip_Files = '*~ *,v s.* tags TAGS cscope.*'

if has("syntax") && (&t_Co > 2 || has("gui_running"))
  syntax on
  function! ActivateInvisibleCharIndicator()
    syntax match TrailingSpace "[ \t]\+$" display containedin=ALL
    highlight TrailingSpace ctermbg=Red
  endf
  autocmd BufNewFile,BufRead * call ActivateInvisibleCharIndicator()
endif
" Show tabs, trailing whitespace, and continued lines visually
set list listchars=tab:»·,trail:·,extends:…

" highlight overly long lines same as TODOs.
set textwidth=280
autocmd BufNewFile,BufRead *.c,*.h exec 'match Todo /\%>' . &textwidth . 'v.\+/'

"powerline{
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
"set guifont=Ubuntu\ Mono\ for\ Powerline\ 12
"set guifont=Consolas\ for\ Powerline\ FixedD:h9
"let g:Powerline_symbols = 'fancy'
"}
"
"
"}}
set rtp+=/home/zliu/projects/github/powerline/powerline/bindings/vim

" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'

""""""""""""""""""""""""""""""""""""""""
" netrw setting
let g:netrw_winsize = 30
nmap <silent> <F6> :Sexplore!<cr>
let g:netrw_altv = 1
"let g:netrw_alto = 1
"let g:netrw_liststyle = 3

""""""""""""""""""""""""""""""""""""""""
" FuzzyFinder setting
nmap <silent> <F5> :FufFile<cr>

""""""""""""""""""""""""""""""""""""""""
" SnipMate
let g:SuperTabMappingForward = "<tab>"
let g:SuperTabMappingBackward = "<shift><tab>"

""""""""""""""""""""""""""""""""""""""""
" VimWiki
map <Leader>we <Plug>VimwikiSplitWord
map <Leader>wq <Plug>VimwikiVSplitWord
map <Leader>wb <Plug>VimwikiGoBackWord
map <Leader>wp <Plug>VimwikiPrevWord
map <leader>tt <Plug>VimwikiToggleListItem
map <leader>wtl :VimwikiTableMoveColumnLeft<CR>
map <leader>wtr :VimwikiTableMoveColumnRight<CR>
let g:vimwiki_folding=1
let g:vimwiki_fold_lists=1
let g:vimwiki_fold_trailing_emtey_lines=1
let g:vimwiki_hl_cb_checked=1


"================================================
" functions
"
""""""""""""""""""""""""""""""""""""""""
"  Auto Pair for parentheses, square brackets and curly braces
"inoremap ( ()<ESC>i
"inoremap ) <c-r>=ClosePair(')')<CR>
""inoremap { {<CR>}<ESC>kA<CR>
"inoremap { {}<ESC>i
"inoremap } <c-r>=ClosePair('}')<CR>
"inoremap [ []<ESC>i
"inoremap ] <c-r>=ClosePair(']')<CR>
" 首次输入{自动匹配输入了}之后，敲回车自动将}下移一行
" 将输入光标置到{所在行和}所在行的中间
"inoremap <CR> <c-r>=AutoNewLine('}')<CR>

"function! ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endf

"function! AutoNewLine(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<CR>\<ESC>ko"
"    else
"        return "\<CR>"
"    endif
"endf
