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

"--------------------------------- SYNTAX
Plug 'elixir-editors/vim-elixir'
Plug 'elixir-lsp/coc-elixir'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'tidalcycles/vim-tidal'

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
" Prev and next sections (tidal)
map      <C-j>   /--\_s@<CR>
map      <C-k>   ?--\_s@<CR>


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
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
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
nmap <C-f> <Plug>(coc-format-selected)

"Personal/Navigation
nnoremap <leader><Up>    :bfirst<CR>
nnoremap <leader><Left>  :bprev<CR>
nnoremap <leader><Right> :bnext<CR>
nnoremap <leader><Down>  :blast<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>f :Rg<CR>

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
