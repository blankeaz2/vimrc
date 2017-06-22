" My .vimrc file
syntax on
set nocompatible              " be iMproved, required
filetype off                  " required
set shellcmdflag=-c           " non-interactive shell
set number
colo elflord
set hlsearch
set ruler

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
"auto changes working dir, may have bad effect on plugins
"http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * silent! lcd %:p:h

" fzf installed using Homebrew
set rtp+=/usr/local/opt/fzf

"Tern Settings
"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
Plugin 'typedclojure/vim-typedclojure'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/SQLUtilities'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'markcornick/vim-vagrant'
Plugin 'kylef/apiblueprint.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'motus/pig.vim'
Plugin 'robu3/vimongous'
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'
Plugin 'elzr/vim-json'
Plugin 'junegunn/fzf.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'skywind3000/asyncrun.vim'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"AARON'S STUFF
set number
colo elflord
set hlsearch
set ruler

"Async Settings
augroup vimrc
    autocmd QuickFixCmdPost * botright copen 8
augroup END

"Misc bindings
nnoremap <C-t> :tabnew<CR>
nnoremap , $p
map <F2> :cd %:p:h <Bar> new<Space> 
noremap <D-S-Right> gt<CR>
noremap <D-S-Left> gT<CR>

"Clojure bindings
nnoremap <C-e> :Eval<CR>
nnoremap E :%Eval<CR>

"Viewport movements
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"vimrc actions 'Option-v'
noremap √ :vsp $MYVIMRC<CR>

"File search actions 'Option-f'
noremap ƒg :GFiles?<CR>
noremap ƒf :Files<CR>
noremap ƒt :Files 

"Docker actions 'Option-d'
noremap ∂t :!docker
noremap ∂u :AsyncRun docker-compose up -d<CR>
noremap ∂d :AsyncRun docker-compose down<CR>
noremap ∂l :!docker-compose logs<CR>
noremap ∂p :!docker ps -a<CR>

"Tern actions 'Option-t'
noremap †r :TernRefs<CR>
