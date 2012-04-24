

set nocp
"set t_Co=256

colorscheme elflord
set clipboard+=unnamed
set report=0
set formatoptions=tcrqn
"set foldenable
"set foldmethod=indent
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
"Split
map <silent> <C-v> :vsp<CR>
map <silent> <C-s> :sp<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
"imap <C-h> <esc><C-w>h
imap <C-j> <esc><C-w>j
imap <C-k> <esc><C-w>k
imap <C-l> <esc><C-w>l
nmap <silent> [ :vertical res -5<CR>
nmap <silent> ] :vertical res +5<CR>
"nmap <silent> [ <c-w><
"nmap <silent> ] <c-w>>
nmap <silent> - :res -1<CR>
nmap <silent> _ :res +1<CR>
nmap <leader>hm <C-w>_
nmap <leader>vm <C-w>\|
nmap <leader>q <C-w>=

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
map  <C-t> :tabnew<CR>:Explore<cr>
map  <C-y> :tabclose<CR>
imap  <C-e> <ESC>:tabprevious<CR>i
imap  <C-r> <ESC>:tabnext<CR>i
imap  <C-t> <ESC>:tabnew<CR>:Explore<cr>i

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

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function! AutoNewLine(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<CR>\<ESC>ko"
    else
        return "\<CR>"
    endif
endf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings

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

"Automatically remove trailing spaces when saving a file.
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

"Remove indenting on empty line
map <F2> :w<CR>:call CleanupBuffer(1)<CR>:noh<CR>
function! CleanupBuffer(keep)
    " Skip binary files
    if (&bin > 0)
        return
    endif

    " Remove spaces and tabs from end of every line, if possible
    silent! %s/\s\+$//ge

    " Save current line number
    let lnum = line(".")

    " number of last line
    let lastline = line("$")
    let n        = lastline

    " while loop
    while (1)
        " content of last line
        let line = getline(n)

        " remove spaces and tab
        if (!empty(line))
            break
        endif

        let n = n - 1
    endwhile

    " Delete all empty lines at the end of file
    let start = n+1+a:keep
    if
        (start < lastline)
        execute n+1+a:keep .  "," .  lastline .  "d"
    endif

    " after clean spaces and tabs, jump back
    exec "normal " .  lnum .  "G"
endfunction

""""""""""""""""""""""""""""""""""""""""
" Trinity

" Open and close all the three plugins on the same time
nmap <F8>   :TrinityToggleAll<CR>
"nmap <F8>  :TrinityToggleNERDTree<CR>:TrinityToggleTagList<CR>:TrinityToggleSourceExplorer<CR>

" Open and close the srcexpl.vim separately
nmap <F9>   :TrinityToggleSourceExplorer<CR>

" Open and close the taglist.vim separately
nmap <F10>  :TrinityToggleTagList<CR>

" Open and close the NERD_tree.vim separately
nmap <F11>  :TrinityToggleNERDTree<CR>

""""""""""""""""""""""""""""""""""""""""
" Source Explorer

" The switch of the Source Explorer
"nmap <F8> :SrcExplToggle<CR>

" Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8

" Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" In order to Avoid conflicts, the Source Explorer should know what plugins
" are using buffers. And you need add their bufname into the list below
" according to the command ":buffers!"
let g:SrcExpl_pluginList = [
            \ "__Tag_List__",
            \ "[fuf]",
            \ "_NERD_tree_",
            \ "Source_Explorer"
            \ ]

" Enable/Disable the local definition searching, and note that this is not
" guaranteed to work, the Source Explorer doesn't check the syntax for now.
" It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" Let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 1

" Use program 'ctags' with argument '--sort=foldcase -R' to create or
" update a tags file
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R $PWD"

" Set "<F7>" key for updating the tags file artificially
"let g:SrcExpl_updateTagsKey = "<F7>"
let g:NERDTreeWinPos = "left"


""""""""""""""""""""""""""""""""""""""""
" CodeComplete
"let g:user_defined_snippets = "~/.vim/plugin/snipMate.vim"
let g:completekey = "<tab><tab>"   "hotkey

""""""""""""""""""""""""""""""""""""""""
" SnipMate
let g:SuperTabMappingForward = "<tab>"
let g:SuperTabMappingBackward = "<shift><tab>"

""""""""""""""""""""""""""""""""""""""""
" ColorSchemeExplorer
nmap <F3> :sp n<cr>:ColorSchemeExplorer<cr>

""""""""""""""""""""""""""""""""""""""""
" ErrorMarker

let errormarker_errortext = "Er"
let errormarker_warningtext = "Wa" "The maximum length is two characters
"The hightlighting groups that are used to mark the lines that contain warnings and errors can be set by
let errormarker_errorgroup = "ErrorMsg"
let errormarker_warninggroup = "Todo"

let errormarker_warningtypes = "wWiI"
let &errorformat="%f:%l: %t%*[^:]:%m," . &errorformat
let &errorformat="%f:%l:%c: %t%*[^:]:%m," . &errorformat
let errormarker_warningtypes = "wW"

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
