" 编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" ===
" VIM Plug-in Installation
" ===
call plug#begin('~/.vim/plugged')
" YoucompleteMe
Plug 'ycm-core/YouCompleteMe'
" YCM config file auto generate
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" YCM simple config
"Plug 'tdcdev/ycm_simple_conf'
" tagbar
" 需安装ctags `sudo apt install ctags`
Plug 'majutsushi/tagbar'
" Error checking
Plug 'dense-analysis/ale'
" File tree use <c-n> to open 
Plug 'scrooloose/nerdtree'
" Commenter
Plug 'scrooloose/nerdcommenter'
" vim easy align
Plug 'junegunn/vim-easy-align'
" auto pairs
Plug 'jiangmiao/auto-pairs'
" vim-snippets
Plug 'honza/vim-snippets'
" ultisnips
Plug 'SirVer/ultisnips'
" airline
Plug 'vim-airline/vim-airline'

call plug#end()
"-------------------------------

" 插件配置
" ===
" === You Complete ME config
" ===
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" use ide style
" set completeopt=longest,menu
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_register_as_syntastic_checker = 0
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
" 寻找全局配置文件
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_python_interpreter_path = "/usr/bin/python3"
let g:ycm_python_binary_path = "/usr/bin/python3"

let g:ycm_collect_identifiers_from_tags_files =1
" 在注释中也可以补全
" autocmd FileType c,cpp,python 
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf = 0
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
"语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1 
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
let g:ycm_use_clangd = 1
" 取消ycm诊断信息
"let g:ycm_show_diagnostics_ui = 0

" ===
" === tagbar config
" ===
nmap <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags' " tagbar 依赖 ctags 插件
let g:tagbar_width     = 30      " 设置 tagbar 的宽度为 30 列，默认 40 列
let g:tagbar_autofocus = 1       " 打开 tagbar 时光标在 tagbar 页面内，默认在 vim 打开的文件内
" let g:tagbar_left      = 1       " 让 tagbar 在页面左侧显示，默认右边
let g:tagbar_sort      = 0       " 标签不排序，默认排序

" ===
" === ale config
" ===
let g:ale_lint_on_text_changed       = 'normal' " 代码更改后启动检查 
let g:ale_lint_on_insert_leave       = 1        " 退出插入模式即检查
let g:ale_sign_column_always         = 1        " 总是显示动态检查结果
let g:ale_sign_error                 = '>>'     " error 告警符号
let g:ale_sign_warning               = '--'     " warning 告警符号
let g:ale_echo_msg_error_str         = 'E'      " 错误显示字符
let g:ale_echo_msg_warning_str       = 'W'      " 警告显示字符
let g:ale_echo_msg_format            = '[%linter%] %s [%severity%]' " 告警显示格式
 
" C 语言配置检查参数
let g:ale_c_gcc_options              = '-Wall -Werror -O2 -std=c11'
let g:ale_c_clang_options            = '-Wall -Werror -O2 -std=c11'
let g:ale_c_cppcheck_options         = ''
" C++ 配置检查参数
let g:ale_cpp_gcc_options            = '-Wall -Werror -O2 -std=c++14'
let g:ale_cpp_clang_options          = '-Wall -Werror -O2 -std=c++14'
let g:ale_cpp_cppcheck_options       = ''
 
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang', 'gcc'],
\   'c': ['clang', 'gcc'],
\   'python': ['pylint'],
\}
" <F9> 触发/关闭代码动态检查
map <F9> :ALEToggle<CR>

"普通模式下，ak 前往上一个错误或警告，aj 前往下一个错误或警告
nmap ak <Plug>(ale_previous_wrap)
nmap aj <Plug>(ale_next_wrap)
" ad 查看错误或警告的详细信息
nmap ad :ALEDetail<CR>

" ===
" === nerdtree config
" ===
" 映射F2键开启nerdtree
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸' 
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeHighlightCursorline = 1       " 高亮当前行
let NERDTreeShowLineNumbers     = 1       " 显示行号
" 忽略列表中的文件
" let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.egg$', '^\.git$', '^\.repo$', '^\.svn$', '^\.hg$' ]
" 启动 vim 时打开 NERDTree
" autocmd vimenter * NERDTree
" 当打开 VIM，没有指定文件时和打开一个目录时，打开 NERDTree
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" 关闭 NERDTree，当没有文件打开的时候
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" ===
" === nerdcommenter config
" ===
" Use <leader>cc to comment
" Use <leader>cu to uncomment
" Use <leader>ca to switch alternative comment style
" Most usage can find at Readme.md of nerdcommenter.
let g:NERDSpaceDelims            = 1 " 在注释符号后加一个空格
let g:NERDCompactSexyComs        = 1 " 紧凑排布多行注释
let g:NERDDefaultAlign           = 'left' " 逐行注释左对齐
let g:NERDAltDelims_java         = 1 " JAVA 语言使用默认的注释符号
" C 语言注释符号
let g:NERDCustomDelimiters       = {'c': {'left': '/*', 'right': '*/'}}
let g:NERDCommentEmptyLines      = 1 " 允许空行注释
let g:NERDTrimTrailingWhitespace = 1 " 取消注释时删除行尾空格
let g:NERDToggleCheckAllLines    = 1 " 检查选中的行操作是否成功

" ===
" === ultisnips config
" ===
" 插入模式下直接通过<C-v>键来触发UltiSnips的代码块补全 
let g:UltiSnipsExpandTrigger="<C-v>"
" <C-z>弹出UltiSnips的可用列表
let g:UltiSnipsListSnippets="<C-z>"
"<C-j>跳转的到下一个代码块可编辑区 
let g:UltiSnipsJumpForwardTrigger="<C-j>"
"<C-k>跳转到上一个代码块可编辑区 
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" ===
" === airline config
" ===
" 设置中文提示
language messages zh_CN.utf-8 
" 设置中文帮助
set helplang=cn
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double
" 总是显示状态栏 
let laststatus = 2

let g:airline_powerline_fonts                   = 1 " 使用 powerline打过补丁的字体
let g:airline_theme="dark"      " 设置主题
" 开启tabline
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ' '
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1

" 状态栏显示图标设置
if !exists('g:airline_symbols')
	    let g:airline_symbols = {}
endif

" 切换 buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
 
" 关闭当前 buffer
noremap <C-x> :w<CR>:bd<CR>
" <leader>1~9 切到 buffer1~9
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

"-------------------------------
" 选择配色方案
colo pablo

" 禁止生成临时文件
set nobackup
set noswapfile

" 搜索忽略大小写
set ignorecase
set smartcase

" 搜索逐字符高亮
set hlsearch
exec "nohlsearch"
set incsearch
noremap = nzz
noremap - Nzz

" Use <space><CR> to cancle hlsearch 
noremap <space><CR> :nohlsearch<CR>

" 可以在有buffer的地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 历史记录数
set history=1000

" 增强模式中的命令行自动完成操作
set wildmenu

" 显示行号
set number

" 行号显示快捷键
map snu :set number<CR>
map snnu :set nonumber<CR>

" 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 打开标尺
set ruler

" 显示底部8行
set scrolloff=8

" vim内左右上下分屏快捷键
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>

" 映射space键用于分屏切换
map <space>l <C-w>l
map <space>h <C-w>h
map <space>j <C-w>j
map <space>k <C-w>k

" 显示输入的命令
set showcmd

" 设置自动缩进
set ai

" 高亮显示匹配的括号
set showmatch
set showmode

" 状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

" 总是显示状态行
set laststatus=2

" Tab键的宽度
set tabstop=2

" 统一缩进为2
set softtabstop=2
set shiftwidth=2

" 不要用空格代替制表符
set noexpandtab

" 保存全局变量
set viminfo+=!

" 为C程序提供自动缩进
set smartindent

" 开启terminal Color 256色
set t_Co=256

" 指定在选择文本时，光标所在位置也属于被选中的范围
set selection=inclusive

" 语法高亮
syntax on

" SHIFT+s 保存
map S :w<CR>
map s <nop>

" SHIFT+q 退出
map Q :q<CR>

" 设置光标横线
set cursorline

" 自动换行
set wrap

" 保持所有终端配色一致
let &t_ut=''

" 让vim支持多文件格式
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" 显示所有空格
"set list

set autochdir

" 粘贴模式快捷键
map sp :set paste<CR>
map snp :set nopaste<CR>

" Move current line quickly
" Use '2[m' to move curret line up 2 offset
nnoremap [m  :<c-u>execute 'move -1-'. v:count1<cr> 
" Use '2]m' to move curret line down 2 offset
nnoremap ]m  :<c-u>execute 'move +'. v:count1<cr>

" Insert blank line quickly
" use 2[<space> to insert 2 blank line before current line 
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
" use 2]<space> to insert 2 blank line behind crrent line  
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

"在打开多文件下，退出当前文件，光标保持在上次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Set new file title config
" ===
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func! SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1, "##########################################################################") 
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: Jonewan") 
		call append(line(".")+2, "# mail: jonewan@yeah.net") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "#########################################################################") 
		call append(line(".")+5, "#!/bin/bash")
		call append(line(".")+6, "")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: Jonewan") 
		call append(line(".")+2, "	> Mail: jonewan@yeah.net ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 

" Reload the vimrc automaticly
autocmd BufWritePost $MYVIMRC source $MYVIMRC 
" Check the syntax style automaticly
"autocmd BufWritePost ~/.Xdefaults call system('xrdb ~/.Xdefaults'
