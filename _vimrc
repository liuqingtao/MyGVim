"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ��ʾ���  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set cul "�������������
set cuc
set shortmess=atI   " ������ʱ����ʾ�Ǹ�Ԯ���ڸɴ��ͯ����ʾ  
set go=             " ��Ҫͼ�ΰ�ť  
"color github     " ���ñ�������  
color desert     " ���ñ�������  
"color torte     " ���ñ�������  
"set guifont=Courier_New:h10:cANSI   " ��������  
"autocmd InsertLeave * se nocul  " ��ǳɫ������ǰ��  
autocmd InsertEnter * se cul    " ��ǳɫ������ǰ��  
set ruler           " ��ʾ���  
set showcmd         " �����������ʾ�������������Щ
set whichwrap+=<,>,h,l   " ����backspace�͹�����Խ�б߽�(������)  
set scrolloff=3     " ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "״̬����ʾ������  
set laststatus=2    " ������ʾ״̬��(1),������ʾ״̬��(2)  
"set foldenable      " �����۵�  
""set foldmethod=manual   " �ֶ��۵�  
set nocompatible  "ȥ��������й�viһ����ģʽ��������ǰ�汾��һЩbug�;���  
" ��ʾ���İ���
if version >= 603
	set helplang=cn
"	set encoding=utf-8
endif
" �Զ�����
set autoindent
set cindent
" Tab���Ŀ��
set tabstop=4
" ͳһ����Ϊ4
set softtabstop=4
set shiftwidth=4
" ��Ҫ�ÿո�����Ʊ��
set expandtab
" ���кͶο�ʼ��ʹ���Ʊ��
set smarttab
" ��ʾ�к�
set number
" ��ʷ��¼��
set history=1000
"�������ַ�����
set hlsearch
set incsearch
"��������
set langmenu=zh_CN.UTF-8
set helplang=cn
" ������ʾ״̬��
set cmdheight=2
" ����ļ�����
filetype on
" �����ļ����Ͳ��
filetype plugin on
" Ϊ�ض��ļ�����������������ļ�
filetype indent on
" ����ȫ�ֱ���
set viminfo+=!
" �������·��ŵĵ��ʲ�Ҫ�����зָ�
set iskeyword+=_,$,@,%,#,-
" �ַ���������������Ŀ

"��tab�滻Ϊ�ո�
nmap tt :%s/\t/    /g<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""���ļ�����
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"�½�.c,.h,.sh,.java�ļ����Զ������ļ�ͷ 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""���庯��SetTitle���Զ������ļ�ͷ 
func SetTitle() 
	"����ļ�����Ϊ.sh�ļ� 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: ") 
		call append(line(".")+2, "	> Mail: ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"�½��ļ����Զ���λ���ļ�ĩβ
endfunc
autocmd BufNewFile * normal G


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"��������
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nmap <silent> <F9> <ESC>:Tlist<RETURN>
" shift tab pages
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
map! <C-Z> <Esc>zzi
map! <C-O> <C-Y>,
map <C-A> ggVG$"+y
map <F12> gg=G
map <C-w> <C-w>w
imap <C-k> <C-y>,
imap <C-t> <C-q><TAB>
imap <C-j> <ESC>
" ѡ��״̬�� Ctrl+c ����
"map <C-v> "*pa
imap <C-v> <Esc>"*pa
imap <C-a> <Esc>^
imap <C-e> <Esc>$
vmap <C-c> "+y
set mouse=v
"set clipboard=unnamed
"ȥ����  
nnoremap <F2> :g/^\s*$/d<CR> 
"�Ƚ��ļ�  
nnoremap <C-F2> :vert diffsplit 
"nnoremap <Leader>fu :CtrlPFunky<Cr>
"nnoremap <C-n> :CtrlPFunky<Cr>
"�г���ǰĿ¼�ļ�  
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"����״�ļ�Ŀ¼  
map <C-F3> \be  
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"�����������
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"C��C++ ��F5��������
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
"C,C++�ĵ���
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc

"����Python���������󶨵�F5���У�F6����
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"  
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m  
autocmd BufRead *.py nmap <F5> :!python %<CR>  
autocmd BufRead *.py nmap <F6> :make<CR>  
autocmd BufRead *.py copen "�����py�ļ�����ͬʱ�򿪱�����Ϣ����

"�����ʽ�Ż���

map <F6> :call FormartSrc()<CR><CR>

"����FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"��������FormartSrc





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""ʵ������
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif
"����vim��û���ļ�ʱ�Զ���NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" ֻʣ NERDTreeʱ�Զ��ر�
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ���õ��ļ����Ķ�ʱ�Զ�����
set autoread
" quickfixģʽ
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"���벹ȫ 
set completeopt=preview,menu 
"������  
"filetype plugin on
"���������  
"set clipboard+=unnamed 
"�Զ�����
set autowrite
"set ruler                   " ��״̬�����
"set cursorline              " ͻ����ʾ��ǰ��
set magic                   " ����ħ��
set guioptions-=T           " ���ع�����
set guioptions-=m           " ���ز˵���
""set foldcolumn=0
""set foldmethod=indent 
""set foldlevel=3 
" ��Ҫʹ��vi�ļ���ģʽ������vim�Լ���
set nocompatible
" ȥ������������ʾ����
set noeb
" �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ��
set confirm
"��ֹ������ʱ�ļ�
set nobackup
set noswapfile
"�������Դ�Сд
set ignorecase




set linespace=0
" ��ǿģʽ�е��������Զ���ɲ���
set wildmenu
" ʹ�ظ����backspace����������indent, eol, start��
set backspace=2
" ����backspace�͹�����Խ�б߽�
set whichwrap+=<,>,h,l
" ������buffer���κεط�ʹ����꣨����office���ڹ�����˫����궨λ��
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" ͨ��ʹ��: commands������������ļ�����һ�б��ı��
set report=0
" �ڱ��ָ�Ĵ��ڼ���ʾ�հף������Ķ�
set fillchars=vert:\ ,stl:\ ,stlnc:\
" ������ʾƥ�������
set showmatch
" ƥ�����Ÿ�����ʱ�䣨��λ��ʮ��֮һ�룩
set matchtime=1
" ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���
set scrolloff=3
" ΪC�����ṩ�Զ�����
"�Զ���ȫ
"":inoremap ( ()<ESC>i
"":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
"":inoremap [ []<ESC>i
"":inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap " ""<ESC>i
"":inoremap ' ''<ESC>i
""function! ClosePair(char)
""	if getline('.')[col('.') - 1] == a:char
""		return "\<Right>"
""	else
""		return a:char
""	endif
""endfunction
filetype plugin indent on 
"���ļ����ͼ��, �������ſ��������ܲ�ȫ
set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags���趨  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"    " ������������  
let Tlist_Use_Right_Window = 1  " ���Ҳ���ʾ����  
let Tlist_Compart_Format = 1    " ѹ����ʽ  
let Tlist_Exist_OnlyWindow = 1  " ���ֻ��һ��buffer��kill����Ҳkill��buffer  
""let Tlist_File_Fold_Auto_Close = 0  " ��Ҫ�ر������ļ���tags  
""let Tlist_Enable_Fold_Column = 0    " ��Ҫ��ʾ�۵���  
"let Tlist_Show_One_File=1            "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
"����tags  
"set tags=tags  
"set autochdir 




