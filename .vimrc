" My .vimrc file
syntax on
set nocompatible              " be iMproved, required
filetype off                  " required
set shellcmdflag=-c           " non-interactive shell
set number
"colo elflord
set hlsearch
set ruler
set foldmethod=syntax

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
"auto changes working dir, may have bad effect on plugins
"http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * silent! lcd %:p:h

" fzf installed using Homebrew
set rtp+=/usr/local/opt/fzf

"netrw Settings
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25

"Tern Settings
"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'

"Javascript Settings
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']

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
Plugin 'dbakker/vim-projectroot'
Plugin 'ternjs/tern_for_vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'rakr/vim-one'
Plugin 'hashivim/vim-consul'
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

"Async Settings
augroup vimrc
    autocmd QuickFixCmdPost * botright copen 8
augroup END

"Colorscheme Settings
let g:airline_theme='one'
colorscheme one
set background=dark " for the dark version
" set background=light " for the light version

" Grep settings
set grepprg=grep\ -n\ $*

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

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
noremap √e :vsp $MYVIMRC<CR>
noremap √s :so $MYVIMRC<CR>

"File search actions 'Option-f'
"find in Git file names
nnoremap ƒg :GFiles?<CR>
"find in filepath [root = current]
nnoremap ƒf :ProjectRootCD<CR> \| :Files<CR>
"find in grep results [input grep search]
nnoremap ƒi :ProjectRootCD<CR> \| :execute "Find " . expand("<cword>")<CR>
vnoremap ƒi y:ProjectRootCD<CR> \| :Find <C-R>"<CR>
"find in buffer names
nnoremap ƒb :Buffers<CR>
"find in buffer lines
nnoremap ƒl :Lines<CR>
"find in tags
nnoremap ƒt :execute "Tags " . expand("<cword>")<CR>

"Buffer actions 'Option-b'
nnoremap ∫p :bprevious<CR>
nnoremap ∫n :bnext<CR>
"delete buffer
nnoremap ∫d :bd<CR>

"Docker actions 'Option-d'
"docker command [input rest]
nnoremap ∂c :!docker 
"docker up with current project
nnoremap ∂u :AsyncRun docker-compose up -d<CR>
"docker down with current project
nnoremap ∂d :AsyncRun docker-compose down<CR>
"docker logs with current project
nnoremap ∂l :!docker-compose logs<CR>
"docker ps
nnoremap ∂p :!docker ps -a<CR>

"Directory actions 'Option-d' + i
"move up one directory
noremap ∂ik :cd ..<CR> \| :pwd<CR>
"move to predicted root directory
noremap ∂ir :ProjectRootCD<CR> \| :pwd<CR>
"move to current file directory
noremap ∂ic :cd %:p:h<CR> \| :pwd<CR>

"Tern actions 'Option-t' + e
"look for refs to current object
nnoremap †er :TernRefs<CR>

"Tags actions 'Option-t' + a
"noremap †ag :AsyncRun find . -type f -iregex ".*\.js$" -exec jsctags {} -f \; \| sed '/^$/d' \| sort > tags<CR>
nnoremap †af :tag<CR>

"Async actions 'Option-a'
noremap åk :AsyncStop<CR>
noremap å :AsyncStop!<CR>

"netrw actions 'Option-e'
nnoremap ´x :Ex <CR>
