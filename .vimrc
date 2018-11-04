set nocompatible  " be iMproved, required
filetype off  " required
set exrc

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ==== plugin manager
Plugin 'VundleVim/Vundle.vim'

" ==== helpers
Plugin 'vim-scripts/L9'

" ==== JS and CSS Beautify  
Plugin 'maksimr/vim-jsbeautify'
"
" ==== Vim Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'edkolev/tmuxline.vim'


set laststatus=2
let g:airline_powerline_fonts = 0
" let g:airline_theme='behelit'

let g:airline#extensions#tabline#enabled = 1
" ==== File tree
Plugin 'scrooloose/nerdtree'
let mapleader = ","
" nmap <leader>ne :NERDTree<cr>
nmap <leader>ne :NERDTreeToggle<cr>
map <silent> <C-n> :NERDTreeFocus<CR>
".vimrc
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" :W sudo saves the file
" " (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" ==== Completion
" Plugin 'Valloric/YouCompleteMe'

" ==== Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ==== syntax helpers
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ap/vim-css-color'
Plugin 'Vimjas/vim-python-pep8-indent'

" ==== moving / searching
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'

" ==== snippets
" Plugin 'SirVer/ultisnips'
" Added below with more options
"

" ==== utilisnips plugin
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ==== Status bar on bottom
" Plugin 'bling/vim-airline'


" ==== Powerline
"Plugin 'powerline/powerline'
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
" set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
" set t_Co=256
" ==== /Powerline
" 
"
"
" ==== PLUGIN THEMES
Plugin 'morhetz/gruvbox'
Plugin 'jimoconnell/onedark.vim'

call vundle#end()
filetype plugin indent on

" ==== Colors and other basic settings
" colorscheme gruvbox
colorscheme onedark
" colorscheme gruvbox
set guifont=Monospace\ 14
set fillchars+=vert:\$
syntax enable
" set background=dark
set ruler
set hidden
set number
set number relativenumber
" :set nonumber norelativenumber  " turn hybrid line numbers off
" :set !number !relativenumber    " toggle hybrid line numbers
set laststatus=2
set smartindent
set st=4 sw=4 et
set shiftwidth=4
set tabstop=4
let &colorcolumn="80"
set wrap linebreak nolist
" ==== :set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set lines=999 columns=999

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>

" ==== Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python']
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'

" === flake8
let g:flake8_show_in_file=1

" ==== snippets
let g:UltiSnipsExpandTrigger="<A-ENTER>"
let g:UltiSnipsJumpForwardTrigger="<A-ENTER>"
let g:UltiSnipsJumpBackwardTrigger="<A-BACKSPACE>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ==== Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)

" ==== moving around
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ==== disable mouse
set mouse=c

" ==== disable swap file warning
set shortmess+=A

" ==== custom commands
command JsonPretty execute ":%!python -m json.tool"
set secure
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
" Track the engine
