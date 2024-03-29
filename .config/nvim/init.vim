"
" Neovim(/Vim 8+) configuration
" Author: Robert White
" TODO: Clean up init.vim/Document plug.vim
" Note: An initial setup takes a long while as YouCompleteMe has several
" large dependencies; setting up from fresh last took 243 seconds.
" Currently YouCompleteMe is set to install the tern-completer for Javascript,
" I recommend you update the settings in plug.vim with the completers you
" require.

" Shell stuffs {{{
  set shell=/bin/bash
" }}}
" Basics {{{
syntax enable
filetype off
set lazyredraw                  " Improve scrolling performance with cursorline
set ttyfast                     " More characters will be sent to the screen for redrawing
" }}}
" Powerline configuration {{{
set laststatus=2
set encoding=utf-8
" set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
" }}}
" Indentation handling {{{
set cindent
set smartindent
set autoindent
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab
set softtabstop=2
set splitbelow
set splitright
" }}}
" Generic Layout Restraints {{{
set number
set ai
set guioptions-=m
set guioptions-=T
set guioptions-=r
set ruler
set hidden
set eol
" }}}
" Backup and Swapfile configuration {{{
set nobackup
set nowritebackup
set noswapfile
" Due to my tendency of saving/closing files mid-edit, the much needed:
set undofile
set undodir=~/.vim_undo,~/tmp
" }}}
" Make backspace work as expected {{{
set backspace=indent,eol,start
" }}}
" Search configuration {{{
set hlsearch
set incsearch
nnoremap t :nohlsearch<cr>
" set showmatch " Highlight matching braces
" }}}
" Share the MacOS clipboard {{{
set clipboard=unnamed
" }}}
" Powerline configuration {{{
let g:airline_powerline_fonts = 1
" }}}
" Ack.vim configuration {{{
" let g:ackprg="ack -H --nocolor --nogroup --column"
let g:ackprg = 'rg --vimgrep --no-heading'
" }}}
" Custom commands {{{
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction
" Note - Never WRITE on Memory
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" }}}
" Leader commands {{{
  " Because I have big hands and my left thumb never seems to leave spacebar
let mapleader=" "
map <leader><leader> <c-^>
map <leader>t :CtrlP<cr>
" Try FZF instead of Ctrl-P
" map <leader>t :FZF<cr>
" }}}
" Vim-Ruby hacks {{{
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
" }}}
" Autoload Vim plugins {{{
source ~/.config/nvim/plug.vim
" }}}
" Set theme (dependent on plugins loaded) {{{
let g:impact_transbg=1
colorscheme NeoSolarized " solarized
set background=light
" }}}
" Configure Alchemist.vim to point at cloned source codes for Elixir and OTP {{{
let g:alchemist#elixir_erlang_src = "/usr/local/share/src"
" " }}}
" " Tab completion overrides and configuration {{{
" "
" " make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:SuperTabCrMapping = 0
"
" " better key bindings for UltiSnipsExpandTrigger
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
" }}}
" Tabularize! =] {{{
vmap <leader><leader> :Tabularize /
" Automatic tabularizing of tables e.g. | foo | bar |
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
" }}}
" Fold control {{{
set fdm=syntax
noremap L zo
noremap H zc
set fdl=1
" }}}
" Syntax extensions {{{
" au BufRead,BufNewFile *.css set ft=css
" au BufRead,BufNewFile *.md set ft=markdown
" }}}
" Ctrl-P speed-up/configuration {{{
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|_build' " Ignore basics when using Ctrl-P searching
let g:ctrlp_use_caching = 0 " Experimental to see how it works for frequency
" Use 'The Silver Searcher' if available
if executable('rg')
  " Use rg over grep
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif

" if executable('ag')
"   " Use ag in CtrlP for listing files. Fast enough and consistent ordering.
"   set grepprg=ag\ --nogroup\ --nocolor
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif

" }}}
" Easier split navigation {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}

highlight clear SignColumn

" Comment out Neomake for now
""" " NeoMake {{{ Automatically run linting on file save
""" if has('autocmd')
"""   autocmd! BufWritePost * Neomake
""" endif
"""
""" let g:neomake_elixir_sky_dogma_maker = {
"""     \ 'exe': 'mix',
"""     \ 'args': ['lint.dogma', '%:p', '--format=flycheck'],
"""     \ 'errorformat': '%E%f:%l:%c: %.: %m'
"""     \ }
"""
""" """ open list without moving the cursor; use :ll to jump to current error
""" let g:neomake_open_list = 2
""" nnoremap <leader>ne :ll<CR>
""" """ verbose behaviour
""" let g:neomake_verbose=3
""" """ error log file
""" let g:neomake_logfile=$HOME.'/.nvim/log/neomake.log'
"""
""" let g:neomake_autolint_cachedir='~/.nvim/cache'
""" let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'sky_dogma']
""" let g:neomake_javascript_enabled_makers = ['eslint', 'flow', 'prettier']
""" let g:neomake_jsx_enabled_makers = ['eslint', 'prettier']
""" let g:neomake_autolint_sign_column_always = 1
""" let g:neomake_open_list = 0
""" let g:jsx_ext_required = 0
"""
""" let g:neomake_markdown_enabled_makers = [] " Disable writegood for now

" }}}
" AirLine / FZF Configuration {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split' }

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }

function! s:fzf_statusline()
  " Override statusline as you like
  highlight default fzf1 ctermfg=161 ctermbg=238 guifg=#E12672 guibg=#565656
  highlight default fzf2 ctermfg=151 ctermbg=238 guifg=#BCDDBD guibg=#565656
  highlight default fzf3 ctermfg=252 ctermbg=238 guifg=#D9D9D9 guibg=#565656
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_nvim_statusline = 0
let g:airline_skip_empty_sections = 1
let g:airline_extensions = ['branch', 'tabline']

" }}}

set termguicolors
set mouse=a

" Terminal
" Extensions/Overrides {{{

" }}}
" Key-mappings {{{
" Sensible escape sequence within a terminal
if has('nvim')
  tnoremap <Esc><Esc> <C-\><C-n>
endif
" }}}

set guicursor+=a:blinkon0

highlight Search guibg=White guifg=NONE
highlight Visual guibg=White guifg=NONE
highlight Cursor guifg=White guibg=NONE
highlight iCursor guifg=White guibg=NONE

highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=NONE gui=NONE guifg=#000 guibg=NONE

autocmd FileType java setlocal omnifunc=eclim#java#complete#CodeComplete
let g:EclimCompletionMethod = 'omnifunc'

autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

let g:user_emmet_leader_key=","

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" let g:LanguageClient_serverCommands = {
"     \ 'elixir': ['~/.elixir/language-server/language_server.sh'],
"     \ 'java': ['~/.java/language-server/language_server/bin/launcher'],
"     \ 'javascript': ['~/.javascript/language-server'],
"     \ 'typescript': ['~/.javascript/language-server'],
"     \ 'go': ['gopls', 'serve'],
"     \ 'ruby': ['solargraph', 'stdio'],
"     \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gu :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:LanguageClient_fzfContextMenu = 1

" Play around with some random encryption fun {{{

function Encrypt()
  if get(b:, 'enc_password', '') == ''
    let b:enc_password = input('Enter password to encrypt: ')

    call Encrypt()
    return
  endif

  redraw!

  execute "%! openssl enc -aes-256-cbc -a -k " . b:enc_password
endfunction

function Decrypt()
  if get(b:, 'enc_password', '') == ''
    let b:enc_password = input('Enter password to decrypt: ')

    call Decrypt()
    return
  endif

  redraw!

  execute "%! openssl enc -d -aes-256-cbc -a -k " . b:enc_password
endfunction

autocmd BufWritePre *.enc :call Encrypt()
autocmd BufRead,BufWritePost *.enc :call Decrypt()

" }}}

source ~/.config/nvim/coc.vim

" vim:foldmethod=marker:foldlevel=0

" Load Debug Adapter Protocol configurations {{{
luafile ~/.config/nvim/telescope.lua
luafile ~/.config/nvim/dap.lua
luafile ~/.config/nvim/neotest.lua
" }}}

" Configure vim-ultest {{{
let g:ultest_deprecation_notice = 0
" let test#javascript#jest#executable = 'yarn jest'
let test#javascript#jest#executable = 'yarn test'
" let test#javascript#jest#options = "--color=always --runInBand --setupTestFrameworkScriptFile=\"<rootDir>/jest.setupAfterEnv.ts\" --forceExit"
" let test#javascript#jest#options = "--color=always --runInBand --forceExit"
let g:ultest_env = {'CI': 'true', 'LOG_LEVEL': 'fatal'}
nnoremap <silent> <leader>rs :UltestSummary<CR>
nnoremap <silent> <leader>rn :UltestNearest<CR>
nnoremap <silent> <leader>rf :Ultest<CR>
nnoremap <silent> <leader>rl :UltestLast<CR>
nnoremap <silent> <leader>rd :UltestDebug<CR>

let g:ultest_use_pty = 1
let g:ultest_running_sign="●"

hi UltestPass ctermfg=Green guifg=#859900
hi UltestFail ctermfg=Red guifg=#dc322f
hi UltestRunning ctermfg=Yellow guifg=#b58900
hi UltestBorder ctermfg=Red guifg=#dc322f
hi UltestSummaryInfo ctermfg=cyan guifg=#2aa198 gui=bold cterm=bold
" }}}

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

let g:tar_cmd="/usr/local/bin/gtar"
