if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

  Plug 'scrooloose/nerdtree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'kien/ctrlp.vim'
  Plug 'prettier/vim-prettier'
  Plug 'tpope/vim-commentary'
  Plug 'haishanh/night-owl.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'bling/vim-airline'
  Plug 'arzg/vim-colors-xcode'

  Plug 'dart-lang/dart-vim-plugin'
  " Plug 'natebosch/vim-lsc'
  " Plug 'natebosch/vim-lsc-dart'
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Plug 'vim-airline/vim-airline-themes'
  " Plug 'valloric/youcompleteme'
  " Plug 'tell-k/vim-autopep8'
  Plug 'tasn/vim-tsx'

call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

" ctrlp:
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" prettier config:
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

let mapleader =","
set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus

" Some basics:
nnoremap c "_c
set nocompatible
filetype plugin on
filetype indent on
syntax on
set encoding=utf-8
set number relativenumber
" Enable autocompletion:
set wildmode=longest,list,full
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, 
set splitbelow splitright

" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

syntax enable
colorscheme night-owl

" let g:airline_theme = 'night_owl'
" let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#branch#enabled = 1
" let g:airline_left_sep = ' ❤  '
" let g:airline_right_sep = ' 🟆  '
" let g:airline_section_warning = '⚠️'
" let g:airline_section_y = '🎶'
" let g:airline_section_x = '🎶'


" let g:livepreview_previewer = 'zathura'
map <leader>kk :!sh -xc 'pdflatex % && zathura %:r.pdf' <CR>
map <leader>r :!sh -xc 'pdflatex main.tex' <CR>
map <leader>b :!sh -xc 'python compile_refs.py main' <CR>


set softtabstop=0 noexpandtab
set shiftwidth=2


" move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" autopep8

let g:autopep8_on_save = 1	
let g:autopep8_disable_show_diff=1



"tab for completion:
" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction


" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" augroup vim-colors-xcode
"     autocmd!
" augroup END

" autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
" autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" dart
let g:lsc_auto_map = v:true
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
