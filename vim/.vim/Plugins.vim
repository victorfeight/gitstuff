filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'tmhedberg/matchit'
Plugin 'vim-scripts/python_match.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/zim-syntax'
Plugin 'hdima/python-syntax'
Plugin 'hynek/vim-python-pep8-indent'
"Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ

"" Plugin Settings

" syntax for zim files
au BufNewFile,BufRead /mnt/shared/Notebooks/Notes/*.txt set syntax=zim

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" python-syntax
let python_highlight_all = 1
let python_version_2 = 1

" syntastic settings
let syntastic_python_checkers = ['flake8']
let g:syntastic_check_on_open = 1

