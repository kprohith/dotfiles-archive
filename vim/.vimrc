
"--------------------------------------------------------------------
"   HIGHLIGHTING AND SYNTAX
"--------------------------------------------------------------------
set background=dark             " Use a dark background by default
"syntax on                       " Enable syntax highlighting
set t_Co=256                    " Allow vim to display all colours
set showmatch                   " Highlight matching parentheses
"colorscheme onedark

"--------------------------------------------------------------------
"   INDENTATION
"--------------------------------------------------------------------
set tabstop=8                   " Set the number of visual spaces per tab
set softtabstop=4               " Set the number of spaces a tab counts as
set expandtab                   " Write tabs as spaces
set autoindent                  " Turn on auto-indentation
set shiftwidth=4                " Set the number of columns to indent with reindent operations
filetype indent on              " Allow loading of language specific indentation

"--------------------------------------------------------------------
"   COLOUR COLUMN
"--------------------------------------------------------------------
set colorcolumn=80              " Create a column at the 80 character line
highlight ColorColumn ctermbg=8 guibg=lightgrey

"--------------------------------------------------------------------
"   MISCELLANEOUS
"--------------------------------------------------------------------
set number                      " Show line numbers
set wildmenu                    " Turn on the autocomplete menu
set mouse=a                     " Enable mouse support
set ruler                       " Display the ruler in the bottom right corner
set cursorline                  " Highlight the current line
set backspace=indent,eol,start  " Allow backspace to work across lines
set nocompatible
set incsearch
set ignorecase
set smartcase
set laststatus=2
set backspace=indent,eol,start
set relativenumber

nmap Q <Nop>

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'zhou13/vim-easyescape'

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>
