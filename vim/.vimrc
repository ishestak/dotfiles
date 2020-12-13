set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'slim-template/vim-slim.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-syntastic/syntastic'
" Plugin 'Valloric/YouCompleteMe'
Bundle 'raimondi/delimitmate'
Plugin 'briancollins/vim-jst'
Plugin 'digitaltoad/vim-jade'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Plugin 'rust-lang/rust.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'evidens/vim-twig'
Plugin 'othree/html5.vim'
Plugin 'danro/rename.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'grep.vim'

call vundle#end()
syntax enable
filetype plugin indent on

map <C-n> :NERDTreeToggle<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Clipboard
" ---------
"
set clipboard^=unnamed,unnamedplus
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Colours
" -------
"
let base16colorspace=256
highlight ColorColumn ctermbg=96
highlight Visual ctermfg=white ctermbg=96

" Silver Searcher
" ---------------
"
" better grep with the silver searcher.
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let mapleader = ","

let delimitMate_expand_space = 1
au FileType tcl let b:delimitMate_expand_space = 1

" Rust
" ----
"
au BufRead,BufNewFile *.rs set filetype=rust
let g:rustfmt_autosave = 1
let g:rust_recommended_style = 0
augroup filetype_rust
  autocmd!
  autocmd BufReadPost *.rs setlocal filetype=rust
  setl sw=2 sts=2 et
augroup END

" Show an indication when we are over 80 chars
let &colorcolumn=join(range(81,81),",")
au FileType qf setlocal nonumber colorcolumn=

" javascript
" ----------
"
" run standard on write \o/
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_standard_exec = 'standard'
autocmd bufwritepost ~/code/lrlna/*.js silent !standard --fix %
set autoread

" Deletion
" --------
"
" get <Del> to work properly
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set number
set textwidth=80     " Show gutter at 80 chars

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git\|\.hg\|\.svn\|\.redo\|dist\|cabal-dev\|lib-cov'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_switch_buffer=0
