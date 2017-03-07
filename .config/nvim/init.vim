"
" Neovim(/Vim?) configuration
" Author: Robert White
" TODO: Clean up init.vim/Document plug.vim
" Note: An initial setup takes a long while as YouCompleteMe has several
" large dependencies; setting up from fresh last took 243 seconds.
" Currently YouCompleteMe is set to install the tern-completer for Javascript,
" I recommend you update the settings in plug.vim with the completers you
" require.

" Shell stuffs
set shell=/bin/bash

" Basics
syntax enable
filetype off
set background=light

" Powerline
set laststatus=2
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

" Indentation handling
set cindent
set smartindent
set autoindent
set tabstop=4
set expandtab
set shiftwidth=2
set smarttab
set softtabstop=4

" Generic Layout Restraints
set number
set ai
set guioptions-=m
set guioptions-=T
set guioptions-=r
set ruler
set hidden
set eol

" Because lots of temporary files annoy me
set nobackup
set nowritebackup
set noswapfile
" Due to my tendency of saving/closing files mid-edit, the much needed:
set undofile
set undodir=~/.vim_undo,~/tmp

" Make backspace work as expected
set backspace=indent,eol,start

" Needs moar search
set hlsearch
set incsearch

" Share the MacOS clipboard
set clipboard=unnamed

" Test fancy Powerline
let g:airline_powerline_fonts = 1

" 'Acking about in Vim
let g:ackprg="ack -H --nocolor --nogroup --column"

" Keeping things clean.
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction
" Note - Never WRITE on Memory
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Because I have big hands and my left thumb never seems to leave spacebar
let mapleader=" "
map <leader><leader> <c-^>
map <leader>e :edit <C-R>=expand("%:h")<cr>/
map <leader>v :view <C-R>=expand("%:h")<cr>/
map <leader>t :CtrlP<cr>

" Vim-Ruby Magix - Oh noes!
function! RubyEndToken ()
  let current_line = getline( '.' )
  let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
  let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
  let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

  if match(current_line, braces_at_end) >= 0
    return "\<CR>}\<C-O>O"
  elseif match(current_line, stuff_without_do) >= 0
    return "\<CR>end\<C-O>O"
  elseif match(current_line, with_do) >= 0
    return "\<CR>end\<C-O>O"
  else
    return "\<CR>"
  endif
endfunction

" Still part of above \"Magix" - I should probably refactor it
function! UseRubyIndent ()
  setlocal tabstop=8
  setlocal softtabstop=2
  setlocal shiftwidth=2
  setlocal expandtab

endfunction
autocmd FileType ruby,eruby call UseRubyIndent()

source ~/.config/nvim/plug.vim

set background=light
colorscheme solarized

" Configure Alchemist.vim to point at Homebrew elixir installation
"
let g:alchemist#elixir_erlang_src = "/usr/local/Cellar"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

" Tabularize! =]
map <leader>a :Tabularize /
set fdm=syntax
noremap L zo
noremap H zc
set fdl=1
nnoremap t :nohlsearch<cr>

au BufRead,BufNewFile *.css set ft=css syntax=css3
au BufRead,BufNewFile *.md set ft=markdown syntax=markdown

" Ignore basics when using Ctrl-P searching
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_use_caching = 0 " Experimental to see how it works for frequency

highlight clear SignColumn

" Enable neomake linting for flow JS
if has('autocmd')
  autocmd! BufWritePost * Neomake
endif

""" open list without moving the cursor; use :ll to jump to current error
let g:neomake_open_list = 2
""" verbose behaviour
let g:neomake_verbose=3
""" error log file
let g:neomake_logfile=$HOME.'/.nvim/log/neomake.log'

let g:neomake_autolint_cachedir='~/.nvim/cache'
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_autolint_sign_column_always = 1
let g:neomake_open_list = 0
let g:jsx_ext_required = 0

""" jump to next error
nnoremap <leader>ne :ll<CR>
