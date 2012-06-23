" ---
" File: _vimrc
" Author: iamcheyan
" Description: cheyan's vimrc
" Contact Me: me@iamcheyan.com
" 这个_vimrc的配置是通过符号链接连接到HOME文件夹下的
" ln -s ~/.vim/_vimrc ~/.vimrc
" ---

"定义$VIMFILES变量
if has('unix')
    let $VIMFILES = $HOME.'/.vim'
else
    let $VIMFILES = $VIM.'/vimfiles'
endif

"使用pathogen管理插件
call pathogen#infect()
syntax enable
syntax on					"语法高亮
filetype plugin indent on	"打开文件类型检测

"设置mapleader键
let mapleader = ","
let g:mapleader = ","

"安装了vimcdoc-1.8.0后可以启用中文帮助
set helplang=cn		"设置中文帮助
set encoding=utf-8	"打开uft-8文件不乱码

set history=500		"保留历史记录
set number			"显示行号
set scrolloff=6		"上下可视行数
set magic			"用于正则表达式
set dy=lastline
set backspace=indent,eol,start
set nobackup		"无备份
set showmatch		"显示配对括号
set linespace=2		"行间距
set fdm=manual		"记忆代码折叠
set mouse=a			"设定在任何模式下鼠标都可用
set nocompatible	"不兼容vi模式
set linebreak		"整词换行
"set textwidth=80	" 设置每行80个字符自动换行，加上换行符
"set wrap			" 设置自动折行
set whichwrap=b,s,<,>,[,]	"左右光标移动到头时可以自动下移
set wildmenu		"增强模式的命令行
set autochdir		"自动切换当前目录为当前文件所在的目录

" 关闭遇到错误时的声音提示
set noerrorbells
set novisualbell
set t_vb= " close visual bell

" ---
" 搜索
" ---
" 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set ignorecase
set smartcase

"set nowrapscan		" 搜索到文件两端时不重新搜索
set incsearch		" 实时搜索
set hlsearch		" 搜索时高亮显示被找到的文本

" ---
" 状态栏 
" ---
set showcmd			"状态栏显示目前所执行的指令
"set cmdheight = 4	"命令行高度
set laststatus=2	"总是显示状态栏status line
set ruler			"在编辑过程中，右下角显示光表位置的状态行
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

" 自动完成
set complete=.,w,b,k,t,i
set completeopt=longest,menu

" 代码折叠
"set foldmethod=syntax

"解决gb编码文件乱码
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set clipboard+=unnamed
set directory=~/tmp,/tmp 

" ---
" 图形界面设置
" ---
" 针对MacVim的设置
if has('gui_running')
	set guioptions-=T " 隐藏工具栏
	set guioptions-=m " 隐藏菜单栏
	set guioptions-=L " 隐藏左侧滚动条
	set showtabline=0 " 隐藏Tab栏
	set guioptions+=r	"显示gui右边滚动条

	set cursorline		"高亮光标所在的行
	
	if has("gui_macvim")
		" Mac 下，按 \ff 切换全屏
		map <Leader>ff  :call FullScreenToggle()<cr>

		" I like TCSH :^)
		"set shell=/bin/tcsh

		" Set input method off
		set imdisable

		" Set QuickTemplatePath
		let g:QuickTemplatePath = $HOME.'/.vim/templates/'

		" 如果为空文件，则自动设置当前目录为桌面
		lcd ~/Desktop/

		" 自动切换到文件当前目录
		set autochdir

		" 删除多于的菜单
		"aunmenu Syntax
		aunmenu Window
		aunmenu Tools
	endif

endif

"字体
set guifont=Monaco:h12
set guifontwide=YouYuan:h12
set lines=200 columns=120

"配色
"set background=light	"浅色模式
set background=dark		"深色模式
colorscheme solarized

"使用solarized主题dark模式下自定义隐藏字符的颜色
"guifg为字符颜色,guibg为字符背景颜色
hi SpecialKey guifg=#003f53 guibg=#042b37

" ---
" 标签
" ---
set guitablabel=%t	"让标签栏只显示文件名
set showtabline=2	"开启自带标签

nmap <C-t>   :tabnew<cr>
nmap <C-p>   :tabprevious<cr>
nmap <C-n>   :tabnext<cr>
nmap <C-k>   :tabclose<cr>
nmap <C-Tab> :tabnext<cr> 

noremap <D-M-Left> :tabprevious<cr>
noremap <D-M-Right> :tabnext<cr>

map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>
"for i in range(1, &tabpagemax)
"    exec 'nmap <A-'.i.'> '.i.'gt'
"endfor

" ---
" 格式
" ---
set autoindent		"自动缩进
set smartindent		"在一个新的语句块之后的行自动缩进到下一个级别

"在切换到 normal,insert,search 模式时使用英文输入法
" set noimdisable
" set iminsert=0
" set imsearch=0

"缩进相关的设置
set ts=4			"tabstop    制表符显示的位宽
set sw=4			"shiftwidth 自动缩进时，缩进尺寸为4个空格
set et				"编辑时将所有tab替换为空格
set smarttab		"删除空格时，不用按4次
set softtabstop=4	" 设置按BackSpace的时候可以一次删除掉4个空格

"用制表符表示缩进
set noexpandtab

"显示隐藏字符
set list
"set listchars=tab:"▸-\ 
"set listchars=tab:\|\ ,nbsp:%,trail:
set listchars=tab:\▸\ ,trail:.,extends:>,precedes:<

"匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>

" 去除结尾空格
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" 去掉结尾^M
nnoremap <leader>E :%s/

" ---
" 快捷键
" ---
"使用tab/shift+tab键控制缩进
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" ---
" 语法
" ---
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

"自动补全CSS
":imap <tab> <c-x><c-o> 
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS 

"自动补全括号
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>

function ClosePair(char)
if getline('.')[col('.') - 1] == a:char
	return "\<Right>"
	else
		return a:char
	endif
endf

" ---
" 插件
" ---
"Tlist的配置,需要生成ctags文件后
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" Plugin List: 
" -使用git同步的插件:
"	vimim					中文输入法
		:let g:vimim_map='c-space'	"Ctrl-空格键开关输入法
		:let g:vimim_shuangpin='nature'	"双拼,自然码
		:let g:vimim_custom_color=0		"
		":let g:vimim_custom_label=1
		":let g:vimim_map='no-gi'	"关闭 gi 无菜单窗
		":let g:vimim_map='tab_as_onekey'"
"	snipMate				智能补全
"	xml						XML文件自动补全与标签自动闭合,活用;;
"	surround				快速替换/清除包围符号/标签
"	mru						记录最近打开的文件(o在缓冲区打开,t在新标签打开)
		let MRU_File = $VIMFILES.'/file/_vim_mru_files'
		let MRU_Max_Entries = 30	"记忆最近打开的文件数量
		let MRU_Auto_Close = 1		"窗口打开与关闭(0/1)
		nmap <leader>f :MRU<CR>
"	autoload/pathogen.vim	插件管理器
"	NERD_tree				文件管理,使用,-n启动
		nmap ,n :NERDTree
"	vim-colors-solarized	配色,提供light和dark两种模式
"	zencoding				使用c-y-,转换
"	visualmark				带有颜色的可视书签
"
" -未使用git同步的插件:
"	grep					搜索增强
"	taglist					函数导航
"	project					项目管理插件,使用,-p启动
"		"_vimprojects为指定的文件路径
		nmap ,p :Project ~/.vim/file/_vimprojects
"	js-mark					变量标记和检查
"	after/syntax/css.vim	CSS颜色高亮
"	NERD_commenter			快速注释
"	load_template	 		新建文档模板插件,使用LoadTemplate
		let g:template_path = $VIMFILES.'/template/'
"	colorsel				VIM配色调整工具
"	MatchTag				显示配对的HTML标签
