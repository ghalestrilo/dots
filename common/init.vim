" VIM-PLUG

"call plug#begin()
call plug#begin('~/.config/nvim/plugged')
"--------------------------------- TOOLS
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'      "Directory Explorer
Plug 'scrooloose/nerdcommenter' "Commenting Tool
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'           "File Search
Plug 'wfxr/minimap.vim'
Plug 'elixir-editors/vim-elixir'
"Plug 'w0rp/ale'                 "Linting
"Plug 'junegunn/goyo.vim'        "Focus Mode
"Plug 'junegunn/limelight.vim'   "Block-Scoped Highlighting
Plug 'ayu-theme/ayu-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'airblade/vim-gitgutter'

"--------------------------------- IDE
Plug 'tpope/vim-projectionist' "Configure this to allow :A between code <-> test
Plug 'vim-test/vim-test'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
"Plug 'dyng/ctrlsf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'

"--------------------------------- LANGUAGE SUPPORT
Plug 'elixir-editors/vim-elixir'
Plug 'elixir-lsp/coc-elixir'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'tidalcycles/vim-tidal'

" TEST

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" rescan entire buffer on large ts/js files
"autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
"autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
"syntax sync fromstart

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

let g:minimap_highlight='Visual'

nmap <leader>a <Plug>(coc-codeaction)
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" todo: add autocmd: install coc-lists coc-eslint coc-prettier coc-elixir etc...


" Ignore ctrlp
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Test coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"" TEST

syntax on
filetype plugin indent on

"--------------------------------- COLOR
Plug 'flazz/vim-colorschemes'
Plug 'xero/sourcerer.vim'
Plug 'xero/blaquemagick.vim'
Plug 'nightsense/carbonized'

call plug#end()


"--------------------------------- EDITOR
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2

let mapleader="\<SPACE>"

"colorscheme znake "haskell
"colorscheme maui  "haskell
"colorscheme mustang "default
"colorscheme gruvbox
"colorscheme lucid   "default alt
"colorscheme sourcerer



"Nerdtree
let g:NERDTreeWinPos = "right"

"Minimap
let g:minimap_auto_start = 1

"Keymaps
map      <C-b>   :NERDTreeToggle<CR>
map      <C-r>     :source $MYVIMRC<CR>
"map      <C-b>     :!make<CR>



"nnoremap <C-f>     :Goyo<CR>
"nnoremap <C-\>     :TagbarToggle<CR>
nnoremap <C-C>     :colorscheme 
nnoremap <leader><c> :vs $MYVIMRC<CR>

let g:CtrlSpaceDefaultMappingKey = "<C-space> "


"Floaterm
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

"Vim-Test
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

"Coc
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <F2> <Plug>(coc-rename)
let g:coc_status_warning_sign='>'
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>f <Plug>(coc-format)
"nmap <C-y> <Plug>(coc-format)

"Personal/Navigation
nnoremap <leader><Up>    :bfirst<CR>
nnoremap <leader><Left>  :bprev<CR>
nnoremap <leader><Right> :bnext<CR>
nnoremap <leader><Down>  :blast<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <C-f> :Rg<CR>

"Show tabs on top
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1

"Tidal Config
"let g:tidal_target = "terminal"
let g:tidal_default_config = {"socket_name": "default", "target_pane": "jam:3.0"}

map      <C-Enter>   :TidalSend<CR>
map      <C-S-Enter>   :TidalSend<CR>
map      <C-h>   :TidalHush<CR>

"Tidal Syntax
au BufRead,BufNewFile *.tidal set filetype=haskell
au BufRead,BufNewFile *.tidal set ft=tidal
autocmd FileType haskell nnoremap <buffer> <C-j>   /--\_s@<CR>
autocmd FileType haskell nnoremap <buffer> <C-k>   ?--\_s@<CR>

"Llipuru
set hidden
set nowrap
set number
set termguicolors
colorscheme bubblegum
let ayucolor="mirage"
let g:airline_theme='bubblegum'
colorscheme ayu
set clipboard=unnamedplus
