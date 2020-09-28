" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/5fc9eab788608fb4adcb07a8d79354dcafefaa6a/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
" Plug 'textobj-user'
" Plug 'textobj-rubyblock'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
" Plug 'hail2u/vim-css3-syntax'
Plug 'JulesWang/css.vim'
Plug 'othree/html5.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-bundler'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    " Install YCM with tern completer for Javascript
    !./install.sh --tern-completer
  endif
endfunction

" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-projectionist'
Plug 'isRuslan/vim-es6'
Plug 'tpope/vim-speeddating'
Plug 'mattn/calendar-vim'
" Plug 'mxw/vim-jsx'
Plug 'benekastah/neomake'

" Plug 'derekwyatt/vim-scala'
" Plug 'ensime/ensime-vim'

Plug 'colepeters/spacemacs-theme.vim'
Plug 'joshdick/onedark.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'udalov/kotlin-vim'
Plug 'zxqfl/tabnine-vim'
Plug 'ap/vim-css-color'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'slim-template/vim-slim'
Plug 'mattn/emmet-vim'

Plug 'leafgarland/typescript-vim'

Plug 'cespare/vim-toml'

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'jamessan/vim-gnupg'

Plug 'StanAngeloff/php.vim'

call plug#end()
