" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/5fc9eab788608fb4adcb07a8d79354dcafefaa6a/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')

" Visual Extensions
" Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'HaaR/NeoSolarized', { 'branch': 'task/add-floating-window-support' }
Plug 'colepeters/spacemacs-theme.vim'
Plug 'joshdick/onedark.vim'

" Functionality Extensions

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'justinmk/vim-sneak'
Plug 'ctrlpvim/ctrlp.vim'

" Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'

Plug 'godlygeek/tabular'
" Plug 'zxqfl/tabnine-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'

" Language specific Extensions

Plug 'elixir-lang/vim-elixir'
Plug 'udalov/kotlin-vim'
Plug 'ap/vim-css-color'

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'isRuslan/vim-es6'

Plug 'vim-ruby/vim-ruby'
Plug 'JulesWang/css.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'slim-template/vim-slim'
Plug 'mattn/emmet-vim'
Plug 'cespare/vim-toml'

Plug 'udalov/kotlin-vim'

Plug 'leafgarland/typescript-vim'

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'Pocco81/DAPInstall.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'theHamsta/nvim-dap-virtual-text'

" Framework specific Extensions

Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'antoinemadec/FixCursorHold.nvim'
" Plug 'nvim-neotest/neotest'
Plug 'David-Kunz/jester'

" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-rails'

" Plug 'textobj-user'
" Plug 'textobj-rubyblock'

" Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-speeddating'
" Plug 'mattn/calendar-vim'
" Plug 'benekastah/neomake'

" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
"
" Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
"
" Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
"
" Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
"
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
"
" Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}

" Plug 'neovim/nvim-lsp'
Plug 'pantharshit00/vim-prisma'

call plug#end()
