" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" if has("vms")
  " set nobackup		" do not keep a backup file, use versions instead
" else
  " set backup		" keep a backup file
" endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

"set list

set listchars=tab:»┈,trail:•,eol:↩
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set softtabstop=2
set shiftwidth=2
set expandtab
set number
set list

call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
" Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
" Plug 'chriskempson/base16-vim'
Plug 'yaymukund/vim-rabl'
Plug 'flazz/vim-colorschemes'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'JulesWang/css.vim'
" Plug 'fleischie/vim-styled-components'
Plug 'vim-scripts/Align'
Plug 'tpope/tpope-vim-abolish'

Plug 'Raimondi/delimitMate'
set backspace=2
let delimitMate_expand_cr=2

Plug 'tpope/vim-surround'

Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-textobj-user'
Plug 'fvictorio/vim-textobj-backticks'

call plug#end()

set laststatus=2
let g:airline_powerline_fonts = 1

" https://github.com/kien/ctrlp.vim#basic-options
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|tmp|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|png|jpg|sqlite3)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" Let directories that contain Gemfile indicate ctrlp root, useful for
" inspecting gems
let g:ctrlp_root_markers = ['Gemfile']

let g:jsx_ext_required = 0

set smartcase
set ignorecase

" set background=dark
" set background=light

set cursorline

set nowrap

" colorscheme Tomorrow
colorscheme Tomorrow-Night-Eighties
" colorscheme base16-default-dark
" colorscheme base16-tomorrow-night-custom
" colorscheme base16-tomorrow
" let base16colorspace=256


map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Mappings to giv Command-line mode tcsh style editing
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

"Not working
"nnoremap <D-V> :r !pbpaste<CR>
"nnoremap <D-C> '<,'>:w !pbcopy<CR>
