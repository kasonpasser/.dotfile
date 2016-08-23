set encoding=utf-8
set termencoding=utf-8
scriptencoding utf-8
syntax on " required

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    set background=dark
    "colorscheme solarized
    colorscheme slate
    set t_Co=256 " make sure our terminal use 256 color
    let g:airline_powerline_fonts=1
endif

set nobackup " make backup file and leave it around
set backupdir=$HOME/.data/backup " where to put backup file
set directory=$HOME/.data/swap " where to put swap file

" Redefine the shell redirection operator to receive both the stderr messages and stdout messages
set shellredir=>%s\ 2>&1
set history=50 " keep 50 lines of command line history
set updatetime=1000 " default = 4000
set autoread " auto read same-file change ( better for vc/vim change )
set maxmempattern=1000 " enlarge maxmempattern from 1000 to ... (2000000 will give it without limit)

behave xterm  " set mouse behavior as xterm
if &term =~ 'xterm'
    set mouse=a
endif

set matchtime=0 " 0 second to show the matching paren ( much faster )
set nu " show line number
set scrolloff=0 " minimal number of screen lines to keep above and below the cursor
set nowrap " do not wrap text
set noacd " no autochchdir

set wildmenu " turn on wild menu, try typing :h and press <Tab>
set showcmd " display incomplete commands
set cmdheight=1 " 1 screen lines to use for the command-line
set ruler " show the cursor position all the time
set hidden " allow to change buffer without saving
set shortmess=aoOtTI " shortens messages to avoid 'press a key' prompt
set lazyredraw " do not redraw while executing macros (much faster)
set display+=lastline " for easy browse last line with wrap text
set laststatus=2 " always have status-line
set titlestring=%t\ (%{expand(\"%:p:.:h\")}/)

" set window size (if it's GUI)
if has('gui_running')
    " set window's width to 130 columns and height to 40 rows
    if exists('+lines')
        set lines=40
    endif
    if exists('+columns')
        set columns=130
    endif
endif

set showfulltag " show tag with function protype.

set ai " autoindent
set si " smartindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode

set cindent shiftwidth=4 " set cindent on to autoinent when editing c/c++ file, with 4 shift width
set tabstop=4 " set tabstop to 4 characters
set expandtab " set expandtab on, the tab will be change to space automaticaly
set ve=block " in visual block mode, cursor can be positioned where there is no actual character
" set Number format to null(default is octal) , when press CTRL-A on number
" like 007, it would not become 010
set nf=

set foldmethod=marker foldmarker={,} foldlevel=9999
set diffopt=filler,context:9999

set showmatch " show matching paren
set incsearch " do incremental searching
set hlsearch " highlight search terms
set ignorecase " set search/replace pattern to ignore case
set smartcase " set smartcase mode on, If there is upper case character in the search patern, the 'ignorecase' option will be override.

" copy folder path to clipboard, foo/bar/foobar.c => foo/bar/
nnoremap <silent> <leader>y1 :let @*=fnamemodify(bufname('%'),":p:h")<CR>
" copy file name to clipboard, foo/bar/foobar.c => foobar.c
nnoremap <silent> <leader>y2 :let @*=fnamemodify(bufname('%'),":p:t")<CR>

" copy full path to clipboard, foo/bar/foobar.c => foo/bar/foobar.c
nnoremap <silent> <leader>y3 :let @*=fnamemodify(bufname('%'),":p")<CR>

" easy buffer navigation
" NOTE: if we already map to EXbn,EXbp. skip setting this
if !hasmapto(':EXbn<CR>') && mapcheck('<C-l>','n') == ''
    nnoremap <C-l> :bn<CR>
endif
if !hasmapto(':EXbp<CR>') && mapcheck('<C-h>','n') == ''
    noremap <C-h> :bp<CR>
endif

" easy diff goto
noremap <C-k> [c
noremap <C-j> ]c
vnoremap < <gv
vnoremap > >gv

" TODO: I should write a better one, make it as plugin exvim/swapword
" VimTip 329: A map for swapping words
" http://vim.sourceforge.net/tip_view.php?tip_id=
" Then when you put the cursor on or in a word, press "\sw", and
" the word will be swapped with the next word.  The words may
" even be separated by punctuation (such as "abc = def").
nnoremap <silent> <leader>sw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o>

" This file will be loaded at the end of .vimrc.
set scrolloff=3            " 设置到底部时距离有三行高 " {
set guioptions=
set vb t_vb=               " 关闭错误时的提示声
set wrap                   " 自动换行
set autoread               " 当外部改变文件时自动加载
set undofile               " 可以无限撤消
set undodir=~/.data/undodir " 无限撤消时的目录
set undolevels=999
set textwidth=90
set colorcolumn=120
"set cmdheight=2
"set cursorcolumn
set cursorline
set tabstop=4
set shiftwidth=4
set list                    " 显示特殊字符
set listchars=tab:\┊\ ,trail:░,eol:┐
set tags+=./tags
set foldmethod=indent foldmarker={,} foldlevel=99
au BufRead,BufNewFile *.pl6 set ft=perl6 syntax=perl
source ~/.dotfile/commplice.vim

" 打开文件时定义到上次的地方
au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif
au BufWinLeave * silent mkview au BufWinEnter * silent loadview
" vim:ts=4:sw=4:sts=4 et fdm=marker:
