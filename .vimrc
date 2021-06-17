set nocompatible
filetype off

syntax enable

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'
Plugin 'shinchu/lightline-gruvbox.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'rhysd/vim-clang-format'
Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'jiangmiao/auto-pairs'

Plugin 'lervag/vimtex'


Plugin 'ajh17/VimCompletesMe'

Plugin 'ludovicchabant/vim-gutentags'

Plugin 'fatih/vim-go'

Plugin 'neovimhaskell/haskell-vim'

Plugin 'lifepillar/vim-solarized8'
call vundle#end()

filetype plugin indent on

" Personalisation
set relativenumber
set number
set tabstop=4
set expandtab
set shiftwidth=4
set ignorecase
set smartcase
set showmatch
set noerrorbells
set novisualbell
set noswapfile
set nobackup
set confirm
set ai
set cursorline
set ruler
set autoindent
set copyindent
set hlsearch
set incsearch
set laststatus=2
set title
set wildmenu

" Key bindings

nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>

autocmd FileType c,cpp nnoremap ; :<C-u>ClangFormat<CR>

cnoreabbrev E e
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa
cnoreabbrev W w
cnoreabbrev Wa wa
cnoreabbrev WA wa

""" Match HTML tags
iabbrev </ </<C-X><C-O>

" Spell checking
autocmd FileType tex,latex,markdown,text set spell spelllang=en_gb complete+=kspell

" Colours
syntax enable
set t_Co=256
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let g:gruvbox_guisp_fallback = "bg"
set bg=dark
colorscheme gruvbox
let g:lightline = { 'colorscheme': 'gruvbox' }

" Plugin Settings

"" Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers=['make']
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_go_checkers = ['go']
let g:syntastic_asm_checkers = ['nasm']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': ['python'],
                            \ 'passive_filetypes': ['html', 'javascript'] }


"" VimTex
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:tex_conceal = ""
let g:vimtex_latexmk_build_dir = './build'

"" UltiSnips
let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"" Journalling
iabbrev date- <c-r>=strftime("%Y/%m/%d")<cr>
