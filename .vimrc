"vi系统设置
syntax on
colo lucius

"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible

"""
"For pathogen.vim: auto load all plugins in .vim/bundle
let g:pathogen_disabled = []

if !has('gui_running')
   call add(g:pathogen_disabled, 'powerline')
endif

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"""

"auto reload vimrc when editing it
"autocmd! bufwritepost .vimrc source ~/.vimrc

"设置颜色位数
set t_Co=256

"设置行号
set number

set hlsearch

"设置自动缩进
set autoindent
set smartindent

set wrap
set linebreak

"set ai!
"set textwidth=120

"自动将tab扩展成空格，防止代码风格混乱，将tab以4个空格替代
set expandtab

"定义tab等同的空格数
set tabstop=4

"按下tab键时，插入的tab数
set softtabstop=4

"自动缩进时指示的空白长度
set shiftwidth=4

set autoread

set completeopt=menu

"检测文件的类型
filetype on
filetype plugin on

"记录历史的行数
set history=1000

"快速查找匹配
"set nohls

set fileencodings=utf-8,gb2312,ucs-bom,euc-cn,euc-tw,gb18030,gbk,cp936

"Taglist设置
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Right_Window=1 
let Tlist_Show_Menu=1
let Tlist_Sort_Type="name"
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

"窗口管理
let g:winManagerWindowLayout='BufExplorer,TagList'
let g:winManagerWidth = 30
let g:AutoOpenWinManager=1
let g:persistentBehaviour=0

au FileType php call AddPHPFuncList()
function AddPHPFuncList()
    	set dictionary-=~/.vim/dict/php_funclist.dict dictionary+=~/.vim/dict/php_funclist.dict
		set complete-=k complete+=k
endfunction

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

"doxygen setting
let g:DoxygenToolkit_briefTag_pre="@synopsis  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "

let g:DoxygenToolkit_authorName="linzh<91u:871101><cleardo@gamil.com>"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_versionString = "1.0.0"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

" --- Command-T
let g:CommandTMaxHeight = 15

" --- SnipMate
let g:snipMateAllowMatchingDot = 0

" --- SuperTab
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

"let g:SuperTabDefaultCompletionType = '<C-x><C-u>'

" --- EasyMotion
"let g:EasyMotion_leader_key = '<Leader>m' " default is <Leader>w
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

"DoxAuthor Dox DoxBlock三个命令的快捷操作
"map <F3>a : DoxAuthor<CR><ESC>kk=G
map <F3>a : DoxAuthor<CR>
map <F3>f : Dox
map <F3>b : DoxBlock<CR>
map <F3>c O/** */<ESC>hhi

nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_left = 1
let g:tagbar_autofocus = 1

"""以下开始热键映射
"map <F5>p :set paste<CR>
"map <F5>n :set nopaste<CR>
map <F5>t :set filetype=c<CR>
set pastetoggle=<F5>p

map <F6>k iecho Kohana::debug()<ESC>i
map <F6>d idebug::info(__FILE__, __LINE__, "debug: ", );<ESC>2ha
map <F6>n ovar_dump(__FILE__, __LINE__, "debug: ", );exit();<ESC>9ha
map <F6>v iHelper_Info::debug(__FILE__, __LINE__, "debug: ", );<ESC>2ha
map <F6>z iCleardo_Info::debug(__FILE__, __LINE__, "debug: ", );<ESC>2ha
map <F6>c iprintf("%s %d %s\n", __FILE__, __LINE__, "");<ESC>3ha
map <F6>t oprintf("%s", xdebug_call_class());printf("::%s",xdebug_call_function());printf(" in %s",xdebug_call_file());printf(":%s\n",xdebug_call_line());
map <F6>a a defined('SYSPATH') OR die('No direct access allowed.');<ESC>o
map <F6>e <ESC>:r! date \+\%F\ \%T 

map <F7> :NERDTreeToggle<CR>

:map <Tab> >
:map <S-Tab> < 

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>

"生成ctags标签
"nmap <F9> <Esc>:!ctags -R *<CR>

"""cecutil.vim - 用途：画图

let g:user_zen_settings = { 
  \  'indentation' : '  ', 
  \  'perl' : { 
  \    'aliases' : { 
  \      'req' : 'require ' 
  \    }, 
  \    'snippets' : { 
  \      'use' : "use strict\nuse warnings\n\n", 
  \      'warn' : "warn \"|\";", 
  \    } 
  \  } 
  \} 
 
let g:user_zen_expandabbr_key = '<c-e>'    "...ctrl+e..
let g:use_zen_complete_tag = 1

let g:html_use_css=1

let Powerline_symbols='compatible'
let g:Powerline_symbols='fancy'

au BufRead,BufNewFile *.js set syntax=jquery

au FileType Makefile set noexpandtab

"只对指定文件类型进行设定
autocmd FileType c,cpp,py,ml set shiftwidth=4 | set expandtab | set tabstop=4 | set softtabstop=4
