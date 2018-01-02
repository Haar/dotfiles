" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/5fc9eab788608fb4adcb07a8d79354dcafefaa6a/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'rake.vim'
Plug 'matchit.zip'
Plug 'textobj-user'
Plug 'textobj-rubyblock'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'ack.vim'
Plug 'fugitive.vim'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'surround.vim'
Plug 'tpope/vim-bundler'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'ervandew/supertab'

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    " Install YCM with tern completer for Javascript
    !./install.sh --tern-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'justinmk/vim-sneak'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-projectionist'
Plug 'isRuslan/vim-es6'
Plug 'tpope/vim-speeddating'
Plug 'mattn/calendar-vim'
Plug 'mxw/vim-jsx'
Plug 'benekastah/neomake'

Plug 'derekwyatt/vim-scala'
Plug 'ensime/ensime-vim'

Plug 'colepeters/spacemacs-theme.vim'
Plug 'joshdick/onedark.vim'
Plug 'slashmili/alchemist.vim'
Plug 'larrylv/ycm-elixir'

call plug#end()
