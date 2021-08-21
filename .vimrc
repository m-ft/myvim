" Basic

set number              " show line numbers

set wrap                " wrap lines

set showmatch           " highlight matching parentheses / brackets [{()}]

set ruler               " show line and column number of the cursor on right side of statusline

set backspace=indent,eol,start " make the backspace work like in most other programs

set bg=dark

set clipboard=unnamed

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25


"""" Vim Appearance
set termguicolors " support true colors
" put colorscheme files in ~/.vim/colors/
colorscheme gruvbox   " good colorschemes: murphy, slate, molokai, badwolf, solarized


" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on

"""" Tab settings
set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces

"""" Vim-Plug
call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

"""" Mapping
cnoremap !py !python3<space>



"""" Copy and Pasting to Clipboard

"Copy text to clipboard after yank
autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe')


"Remove trailing whitespace
function! StripTrailingWhitespace()
    normal mZ
    let l:chars = col("$")
    %s/\s\+$//e
    if (line("'Z") != line(".")) || (l:chars != col("$"))
        echo "Trailing whitespace stripped\n"
    endif
    normal `Z
endfunction

