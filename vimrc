"" Vundle {{{1
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

""" Bundles {{{2
Bundle 'nanotech/jellybeans.vim'

" NERDTree file manager
Bundle 'scrooloose/nerdtree'

" Powereline
Bundle 'Lokaltog/vim-powerline'

" Fugitive - git plugin
Bundle 'tpope/vim-fugitive'

" Shows syntax errors on several types of files
Bundle 'scrooloose/syntastic'

" Tagbar - enabled only when ctags are installed
if executable('ctags')
    Bundle 'majutsushi/tagbar'
endif

" YouCompleteMe - the ultimate syntax completion engine
Bundle 'Valloric/YouCompleteMe'

" Python mode
Bundle 'klen/python-mode'

" Ctrl-P
Bundle 'kien/ctrlp.vim'

" UltiSnips
Bundle 'SirVer/ultisnips'

" undotree
Bundle 'mbbill/undotree'

" smartinput -- closes matching braces, quotes, parentheses etc.
Bundle 'kana/vim-smartinput'
"}}}2

filetype plugin indent on
"}}}1

"" General {{{1
syntax on

" autoread whenever a file is changed from outside
set autoread

" a long history
set history=1000

"always show current position
set ruler

" Always show the statusline
set laststatus=2
" turn on wildmenu
set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ignore case when searching
set ignorecase 
" make insert-matching preserve the already written characters
set infercase 
set smartcase

" highlight search things
set hlsearch 
" make search act like search in modern browsers
set incsearch 
" don't redraw while executing macros 
set nolazyredraw 

" set magic on, for regular expressions
set magic 

" show matching bracets when text indicator is over them
set showmatch 
" how many tenths of a second to blink
set mat=2 

" number of lines to keep above and below the cursor
set scrolloff=5

" no sound on errors
set noerrorbells
set novisualbell

" Always show the statusline
set laststatus=2

" utf8, unix line endings
set encoding=utf8
set ffs=unix

set timeout
set timeoutlen=1000
set ttimeoutlen=100
"}}}1

"" Appearance {{{1
set number numberwidth=4

" colors and fonts
set background=dark
colorscheme jellybeans
set shell=/bin/bash

" gui settings
if has("gui_running")
    set guioptions-=T
    set guioptions-=L
    set guioptions-=l
    set guioptions-=b
    set guioptions-=m
    set guioptions-=r
    set t_Co=256
    set mouse=a
endif
"}}}1

"" Formatting {{{1
set wrap
set linebreak

set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set softtabstop=4
"}}}1

"" Backup {{{1
set backup
set wb
set swapfile

" Persistent undo
try
    set undodir=~/.vim_runtime/undodir
    set undofile
catch
endtry
"}}}1

"" Folding {{{1
set foldmethod=marker
"}}}1

"" Key mappings {{{1
let mapleader=","

" escape clears highlight in normal mode
nnoremap <esc> :noh<cr>

" uppercases the word
inoremap <leader>u <esc>viwUi
nnoremap <leader>u viwU
" lowercases the word
inoremap <leader>l <esc>viwui
nnoremap <leader>l viwu

" open and edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" beginning and end of the line
nnoremap L $
nnoremap H 0
vnoremap L $
vnoremap H 0

" beginning and the end of the file
nnoremap J G
nnoremap K gg
vnoremap J G
vnoremap K gg

" quick save and close
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" smart way of moving between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" opening the windows
nnoremap <C-w>h :topleft vnew<cr>
nnoremap <C-w>l :botright vnew<cr>
nnoremap <C-w>j :botright new<cr>
nnoremap <C-w>k :topleft new<cr>

" adding line up/down
nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>

" disable arrows
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

" open the fold o do the default space thing
nnoremap <silent> <space> @=(foldlevel('.') ? 'za' : "\<Space>")<CR>

" visual shifting (doesn't exit c-mode)
vnoremap < <gv
vnoremap > >gv

" buffers {{{2
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>ls :ls<cr>
" }}}2

" NERDTree {{{2
noremap <silent><F1> :NERDTreeToggle<cr>
"}}}2

" Fugitive {{{2
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>:GitGutter<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>
"}}}2

" Tagbar {{{2
noremap <silent><F2> :TagbarToggle<cr>
" }}}2

" undotree {{{2
nnoremap <silent><F3> :UndotreeToggle<cr>
" }}}2

"}}}1

"" Command mappings {{{1
command! -nargs=* -complete=help Help vertical belowright help <args>
"}}}1

"" Plugins config {{{1
" NERDTree {{{2
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeDirArrows=1
"}}}2

" Powerline {{{2
let g:Powerline_symbols = 'compatible'
let g:Powerline_stl_path_style = 'short'
" }}}2

" Syntastic {{{2
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': [],
	\ 'passive_filetypes': ['html', 'tex']
    \}
"}}}2

" Tagbar {{{2
let g:tagbar_autoclose=0
let g:tagbar_autofocus=1
" }}}2

" python-mode {{{2
let g:pymode_lint = 0
let g:pymode_rope = 0
" }}}2

" Ctrl-P {{{2
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.(git|hg|svn)$',
  \ 'file': '(\.so|\.pyc|\.swo|\.swp|\~)$',
  \ }
" }}}2

" YouCompleteMe {{{2
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '/home/mateusz/.ycm_extra_conf.py'
" }}}2

" UltiSnips {{{2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}2

"}}}1

"" Languages {{{1
" Markdown {{{2
augroup ft_markdown
    autocmd!
    autocmd BufRead,BufNewFile {*.md,*.markdown,*.mkd} set filetype=markdown
augroup END
"}}}2

" C/C++ {{{2
augroup ft_cpp
    autocmd!
    autocmd FileType {cpp,c,java,javascript} setlocal fo=croq
    autocmd FileType {cpp,c,java,javascript} setlocal cindent
    autocmd FileType {cpp,c,java} setlocal cino=:0,g0,N-s,(0
augroup END
" }}}2

" XML/HTML {{{2
augroup ft_xml
    autocmd!
    autocmd BufWritePre,BufRead {*.xml,*.html} :normal gg=G
    autocmd FileType {xml,html} inoremap <leader>/ </<c-x><c-o>
augroup END
" }}}2

" Python {{{2
augroup ft_python
    autocmd!
    autocmd BufWritePre *.py :%s/\s\+$//e
    autocmd FileType python set nowrap
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Grey
    autocmd FileType python match Excess /\%120v.*/
augroup END
" }}}2

" TeX {{{2
augroup ft_tex
    autocmd!
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd FileType tex nnoremap <leader>c :w<cr>:!rubber --pdf --warn all %<cr>
    autocmd FileType tex nnoremap <leader>v :!mupdf %:r.pdf &<cr><cr>
augroup END
" }}}2

"}}}1
