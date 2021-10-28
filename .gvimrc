
"""" Basic

set number              " show line numbers

set wrap                " wrap lines

set showmatch           " highlight matching parentheses / brackets [{()}]

set ruler               " show line and column number of the cursor on right side of statusline

set backspace=indent,eol,start " make the backspace work like in most other programs

set bg=dark

set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
language en                 " sets the language of the messages / ui (vim)

set guioptions -=m          " hides menu bar

set guioptions -=T          " hides tool bar

set guifont=Fira\ Code\ Medium:h14:cANSI

set clipboard=unnamed

set belloff=all

set fencs=ucs-bom,utf-16le,utf-8,default,latin1

""" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25


"""" Vim Appearance
set termguicolors " support true colors
" put colorscheme files in ~/.vim/colors/
colorscheme gruvbox   " good colorschemes: Iceberg, gruvbox

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on


"""" Tab settings
set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces


"""" Mappings
cnoremap !py !python3<space>
nnoremap jsd :<C-u>call JSDocAdd()<CR>

"""" Automate Vim-Plug Install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""" Plugins
call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'joegesualdo/jsdoc.vim'
  Plug 's3rvac/AutoFenc'
call plug#end()

"""" Remove trailing whitespace
function! StripTrailingWhitespace()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  if (line("'Z") != line(".")) || (l:chars != col("$"))
    echo "Trailing whitespace stripped\n"
  endif
  normal `Z
endfunction

autocmd BufWritePre * call StripTrailingWhitespace()


"""" Set backup directory to prevent cluttering in the working dir
let &directory = expand('~/.vimdata/swap//')

set backup
let &backupdir = expand('~/.vimdata/backup//')

set undofile
let &undodir = expand('~/.vimdata/undo//')

if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif


