" General {{{
set nocompatible    " Prevent vi compatibility, ensuring unexpected effects
set encoding=utf-8  " Default character encoding
set showcmd         " Displays commands entered in the file
set showmode        " Show current mode at bottom
set visualbell      " Use visual alert instead of sound
set history=50      " Sets how many lines of history VIM has to remember
set autoread        " Updates buffer when file changed externally
set backspace=eol,start,indent  " Backspace works as expected
set hidden          " Buffers are hidden automatically even if they are modified
let mapleader=" "   " Map leader allows default key to combine with other commands
filetype on  " Load file type specific settings
"}}}
" Plugins {{{
" Download vim-plug if is not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
"  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
call plug#begin('~/.vim/plugged')
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'vim-ruby/vim-ruby'
  Plug 'w0rp/ale'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nvim-tree/nvim-web-devicons' " optional
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'rlue/vim-fold-rspec'
  " Plug 'vim-airline/vim-airline'
  " themes
  "Plug 'yorickpeterse/vim-paper'
  "Plug 'yorickpeterse/nvim-grey'
  #Plug 'rebelot/kanagawa.nvim'
  "Plug 'yorik1984/newpaper.nvim'
  Plug 'projekt0n/github-nvim-theme'
  " syntax
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  Plug 'HerringtonDarkholme/yats.vim' 
  Plug 'elzr/vim-json'
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
  Plug 'vim-python/python-syntax'
  Plug 'aklt/plantuml-syntax'
  " Markdown
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
call plug#end()
" gruvbox options
"let g:gruvbox_bold=0
"let g:gruvbox_italic=1
"let g:gruvbox_contrast_light='hard'
"let g:gruvbox_contrast_light='soft'
" Ale options
let g:ale_linters={
\ 'javascript': ['prettier', 'eslint'],
\ 'python': ['flake8', 'pylint'],
\ 'ruby': ['standardrb']
\}
let g:ale_fixers={
\ 'javascript': ['prettier', 'eslint'],
\ 'python': ['autopep8', 'yapf'],
\ 'ruby': ['standardrb']
\}
let g:ale_linters_explicit=1
" Airline options
let g:airline_powerline_fonts=0
" CtrlP options
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
" UltiSnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-f>'
let g:UltiSnipsJumpBackwardTrigger='<c-b>'
" Python syntax
let g:python_highlight_all = 1
let g:python3_host_prog = "/usr/bin/python3"
" vim-lsp
if executable('standardrb')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'standardrb',
        \ 'cmd': ['standardrb', '--lsp'],
        \ 'allowlist': ['ruby'],
        \ })
endif
" nvim.tree.lua
lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup()
EOF
"}}}
" Functions {{{
if !exists('*MKDir')
  function MKDir(path)
    silent execute '!mkdir '.a:path.' > /dev/null 2>&1'
  endfunction
endif
" }}}
" Macros {{{
runtime macros/matchit.vim
" }}}
" UI {{{
set ruler           " Show the line and column number of the cursor position
set relativenumber  " Shows the relative number from the current cursor position
set numberwidth=2   " Number of columns left for line numbers
set nu!
set cursorline      " Draws an horizontal background or underline on the line the cursor is present
set cursorcolumn    " Draws an vertical backgroung where the cursor is present
set nowrap          " Don't wrap lines
set lazyredraw      " Don't redraw screen if not needed 
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"}}}
" Scrolling {{{
set scrolloff=8       " Screen lines to keep above and below the cursor when scrolling
set sidescrolloff=16  " Screen columns to keep left and right the cursor when side scrolling
set sidescroll=0      " Number of columns the scrolling moves off the screen
" }}}
" Indentation {{{
set tabstop=2     " Tab size
set shiftwidth=2  " Number of spaces when indenting
set expandtab     " Use spaces instead of tabs
set smarttab      " Smart tabs
set autoindent    " Auto indent
set smartindent   " Smart indent
"}}}
" Completion {{{
set wildmenu  " Enabling smart command line completion on wildcard (<Tab> by default)>
filetype on
filetype indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"}}}
" Menu {{{
"source $VIMRUNTIME/delmenu.vim  " Clearing all menus 
"source $VIMRUNTIME/menu.vim     " Lading default menus (default in gvim)
"}}}
" Mappings {{{
"set wildcharm=<tab>             " Sets the key <Ctrl-Z> as a wildcard for mappings and macros executing the autocompletion
" :emenu is executed when typing <F4> along with the autocompletion
"map <F4> :emenu <tab>
" Split window and jump to it
nnoremap <Leader>w <C-w>v<C-w>l " vertical split on the right
nnoremap <Leader>s <C-w>s<C-w>j " horizontal split at bottom
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Strip all trailing whitespace in current file
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Clean highlight search results
nnoremap <leader>, :noh<cr>
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Switch between the last two files
nnoremap <leader><leader> <c-^>
"}}}
" Searching {{{
set ignorecase  " Allows searching not being case-sensitive
set smartcase   " Search patterns with uppercase letters are case-sensitive
set hlsearch    " Highlights all matches
set incsearch   " Incremental search: match first result as you type search pattern
" Ignore next file patterns when searching and completion
set wildignore=*/node_modules/*
set include+=^import.*from.'\zs.*\ze'
"}}}
" Colors {{{
syntax on " Setting on default syntax colors
" set termguicolors
colorscheme github_light_high_contrast
set laststatus=3
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"}}}
" Filetype {{{
filetype indent on  " Load specific settings based on file type
"}}}
" Backups {{{
call MKDir('~/.vim/cache')
call MKDir('~/.vim/cache/swap')
call MKDir('~/.vim/cache/backup')
call MKDir('~/.vim/cache/undo')
set directory^=~/.vim/cache/swap//    " Swap files are stored in provided path
set backupdir^=~/.vim/cache/backup//  " Backup files are store in provided path
set undodir^=~/.vim/cache/undo//      " Undo files are stored in provided path
set backup    " Enables next option if you like to persist backup files
set undofile  " Enables storing undo history per file
"}}}
" Windows {{{
set splitbelow  " Open new split below
set splitright  " Open new vertical split right
" }}}
" Extra {{{
" vim:foldmethod=marker:foldlevel=0
"}}}
