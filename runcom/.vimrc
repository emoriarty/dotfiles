" Leader
let mapleader = " "

set encoding=utf-8  " default encoding
set backspace=2     " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile      " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set laststatus=2    " Always display the status line
set autowrite       " Automatically :write before running commands
set mouse=a         " Enable mouse use in all modes
set ttyfast         " Send more characters for redraws
set exrc            " Enable configuration files per project
set nocompatible    " Gets rid of all compatibility with vi
set modelines=0     " Prevents possible security exploit (http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html)
set undofile        " Creates a file which help you to undo actions even after closing and reopening a file
set ignorecase      " Case insesitive for searchs
set smartcase       " If one of the search cases has uppercase the search will be case-sencitive
set gdefault        " Sets substitutions globally, no need adding /g at the end
set incsearch       " This option and the two next ones higlight search results in a handy way
set showmatch
set hlsearch
nnoremap <leader>, :noh<cr> " Clean highlight search results
set wrap lbr

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundle"))
  source ~/.vimrc.bundle
endif

" ColorScheme
colorscheme spring-night
" colorscheme solarized
" if has('gui_running')
"   set background=light
" else
"   set background=dark
" endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list
set listchars=tab:▸\ ,trail:·,nbsp:·,eol:¬
" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" Numbers
" set number
set relativenumber
set numberwidth=2

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Strip all trailing whitespace in current file
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Escape
inoremap jj <ESC>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Split window and jump to it
nnoremap <Leader>w <C-w>v<C-w>l " vertical split on the right
nnoremap <Leader>s <C-w>s<C-w>j " horizontal split at bottom

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Comments
nnoremap <Leader>c :TComment<cr>

" Ack search tool
nnoremap <Leader>a :Ack

" configure syntastic syntax checking to check on open as well as save
let g:jsx_ext_required = 0

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.

" LINTING
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 0
let g:ale_lint_delay = 0
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'sh': ['shellcheck'],
\  'json': ['jsonlint'],
\  'css': ['csslint'],
\}

set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" airline
let g:airline_powerline_fonts = 1

" Markdown syntax highlight
" Call everytime we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown set filetype=markdown

" Disabling unsafe commands in your project-specific .vimrc
" This will prevent :autocmd, shell and write commands from being run inside
" project-specific .vimrc files unless they’re owned by you.
set secure
