source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction



" ================================
" Encoding
" ================================
" 设置 vim 内部编码。
set encoding=utf-8
set termencoding=utf-8
" 设置当前文件编码。
set fileencoding=utf-8
" 设置支持打开的文件的编码。
set fileencodings=utf-8,chinese,ucs-bom,cp936

" 设置文件的换行符，默认时是 dos,unix 。
set fileformat=unix
" 文件的换行符格式类型。
set fileformats=unix,dos,mac



" ================================
" General
" ================================
" 去掉有关 vi 一致性模式，避免以前版本的一些 bug 和局限。
set nocompatible

" 关闭备份功能。
set nobackup

" 关闭缓冲区的备份功能。如在编辑的时候电脑断电或者 Vim 发生异常退出，并且没有保存，则可以从 .*.swp 里恢复这个文件。
set noswapfile

" 开启写文件的防止灾难功能。文件写入保护，文件正常写入之后就会自动删除。
set writebackup

" 关闭撤销记录的永久保存功能。Vim 会自动将撤消历史记录保存到 .*.un~ 撤消文件中。
set noundofile

" 关闭自动换行功能。
set nowrap



" ================================
" GUI
" ================================
" 隐藏工具栏。
set guioptions-=T
" 隐藏菜单栏。
set guioptions-=m

set background=dark
" 配色方案
colorscheme solarized

" 设置字体和大小
set guifont=Courier_new:h11:cDEFAULT

" 设置 GVim 自动最大化。
if has('win32')
    au GUIEnter * simalt ~x
endif




" ================================
" Format
" ================================
" 启用文件类型侦测。
filetype on

" 语法高亮度显示。
syntax on

" 开启显示行号功能。
set nu!

" vim 使用自动对起，也就是把当前行的对起格式应用到下一行。
" set autoindent
" 开启智能对齐功能。依据上面的对齐格式，智能的选择对齐方式。
set smartindent

" 设置 tab 为空格。
set expandtab
" 设置 tab 的宽度。
set tabstop=4
" 设置换行自动缩进时的宽度。
set shiftwidth=4
" 指定按一次 backspace 就删除 shiftwidth 宽度
set smarttab

" 设置显示空白符号。
set list
" 设置空白符号显示的内容。
set listchars=tab:>-,extends:>,precedes:<

" 突出显示当前行。
set cursorline
" 在编辑过程中，在右下角显示光标位置的状态行
set ruler

