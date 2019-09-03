" My .vimrc
" By Jyry Hjelt
" Essential
set nocompatible
set relativenumber
set number
filetype on

" Setting up powerline statusline
set rtp+=/usr/local/lib/python3.6/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Installing plugins via Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle for Vundle
Plugin 'VundleVim/Vundle.vim'
" Auto completion
Plugin 'Valloric/YouCompleteMe'
" More colors
Plugin 'flazz/vim-colorschemes'
" Syntax checking and a clear tree overview of a project
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/NERDtree'
" More colors :D
Plugin 'altercation/vim-colors-solarized'
" For making code more organized
Plugin 'junegunn/vim-easy-align'
" Easy file awitching
Plugin 'ctrlpvim/ctrlp.vim'
" Rust things
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'cespare/vim-toml'
" Auto pairing for ()'s []'s and {}'s and other things
Plugin 'jiangmiao/auto-pairs'
" Sorting python includes
Plugin 'fisadev/vim-isort'
" Auto-formatting because I'm lazy
Plugin 'rhysd/vim-clang-format'
" Better syntax highlighting hor c++
Plugin 'octol/vim-cpp-enhanced-highlight'
" Indentation marks
Plugin  'Yggdroot/indentLine'
" HTML writing
Plugin 'alvan/vim-closetag'
" LaTeX writing
Plugin 'lervag/vimtex'
" Haskell
Plugin 'neovimhaskell/haskell-vim'
Plugin 'alx741/vim-hindent'
" Vim note-taking
Plugin 'vimwiki/vimwiki'
Plugin 'plasticboy/vim-markdown'
call vundle#end()

" YouCompleteMe settings
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let g:ycm_show_diagnostics_ui = 1 " Disable ycm's diagnostics ui because it is annoying
" YCM highlighting begone!
let g:ycm_allow_changing_updatetime = 0
" Goto definition for YCM supported files
map <F3> :YcmCompleter GoTo<CR>

set backspace=2

" Easy align settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers=['make']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*gbar

let g:syntastic_python_checkers = ['flake8']

let g:closetag_filenames = '*.html,*.xhtml,*phtml'

" c++ compiler flags for syntastic
let g:Syntastic_cpp_compiler = "g++"
let g:Syntastic_cpp_compiler_options = "-stdlib=libc++ -std=c++14 -Wall -Wextra -Wpedantic `pkg-config gtkmm-3.0 --cflags --libs`"
let g:syntastic_disabled_filetypes = ['cpp']
" Set the correct syntax checker for .asm files
let g:syntastic_asm_checkers = ['nasm']
" let g:syntastic_cpp_include_dirs = ["~/Qt5.6.1/5.6/gcc_64/include/*"]

" Formatting
filetype plugin indent on
syntax on

" Bleh.
set tabstop=4
set expandtab
set shiftwidth=4
set ignorecase
set smartcase
set showmatch
set noerrorbells
set noswapfile
set confirm
set ai
set binary
set nofoldenable
set cursorline
set wildmenu

" Search configuration
set incsearch
set hlsearch 
hi Search guibg=Yellow guifg=Black ctermbg=Blue ctermfg=Black

" Shorthands
iabbrev cant can't
" For loops abbreviations for c/c++
autocmd FileType cpp iabbrev fori for(int i = 0; i < ; i++){
autocmd FileType cpp iabbrev forx for(int x = 0; x < ; x++){
autocmd FileType c iabbrev fori for(int i = 0; i < ; i++){
autocmd FileType c iabbrev forx for(int x = 0; x < ; x++){
" Indenting blocks with tab in visual mode
vmap <tab> >

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(o|so|zip)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Assembly syntax
au BufRead,BufNewFile *.asm set filetype=nasm

" Moving around panes easily
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
" Enable the use of solarized colors in vim
let g:solarized_termcolors=256
" Clang-format settings
autocmd FileType c,cpp nnoremap ; :<C-u>ClangFormat<CR>
let g:clang_format#auto_format = 0 " Set automatic formatting on saving 
let g:clang_format#style_options = {
						\"BasedOnStyle": "WebKit",
						\"IndentWidth": 8}

" Indentation marks
let g:indentLine_char = '┆'

" To disable ycm diags
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting= 0

" Config for LaTeX writing
nmap <space>li <plug>(vimtex-info)
let g:vimtex_view_method = 'mupdf'
let g:tex_flavor = 'latex'
set cole=0
let g:tex_conceal = ""

" Spell checking
autocmd FileType tex set spell spelllang=en_gb
autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell

" Move cursor with display lines
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

set completeopt=longest,menuone,preview

" common mistakes fixed
cnoreabbrev E e
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev W w

" vimwiki config
let g:vimwiki_list = [{'path': '~/Shared/JHNAI', 
			\'syntax': 'markdown', 
			\ 'ext': '.md',
 			\ 'template_path': '~/Shared/JHNAI/html_template',
  			\ 'template_default': 'default',
			\ 'custom_wiki2html': '~/Shared/JHNAI/customwiki2html.sh'}]
let g:vim_markdown_math = 1
let g:indentLine_concealcursor = 'n'

set concealcursor-=n

" Colorscheme
colo 1989 
