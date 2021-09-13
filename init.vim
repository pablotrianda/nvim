syntax on set nocompatible

set guicursor=
set showmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
"set termguicolors
set notermguicolors
set scrolloff=8
set ignorecase
set mouse=a
set cursorline
set autoread
set encoding=UTF-8
set clipboard+=unnamedplus

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'obxhdx/vim-auto-highlight'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'APZelos/blamer.nvim'
Plug 'prettier/vim-prettier'
Plug 'tasn/vim-tsx'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'udalov/kotlin-vim'
Plug 'sebdah/vim-delve'
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdcommenter'

" nvim-tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

"Theme
Plug 'joshdick/onedark.vim'

call plug#end()


" --- vim go settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_diagnostic_errors = 1


" Lightline
let g:lightline = { 'colorscheme': 'plastic' }

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25


let g:fzf_layout = { 'window': { 'width':0.8, 'height':0.8}}
let $FZF_DEFAULT_OPTS='--reverse'

"nnoremap <leader>e :Vexplore<CR>
"nnoremap <leader>f :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>E :NvimTreeFindFile   <CR>
nnoremap <leader>e :NvimTreeToggle   <CR>
" apt-get install silversearcher-ag
nnoremap <leader>f :Ag <CR>
nnoremap <Leader>fw :Ag <C-R><C-W><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>x :wincmd c<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Cycle through autocomplete menu using tab
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Save with Ctrl+s
nnoremap <c-s> :w <CR>
nnoremap <c-s> <Esc>:w <CR>

" Spell check (Spanish)
nnoremap <F2> :setlocal spell spelllang=es_ar <CR>
nnoremap <F3> :setlocal spell spelllang=en <CR>

" Behave vim
nnoremap Y y$

" Keeping it centered
nnoremap n nzzzv
nnoremap N nzzzv
nnoremap J mzJ'z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Commands
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command AOpen  !android-studio $1 `echo "%"` 

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

let delimitMate_expand_cr = 1

" Airline config
let g:airline_powerline_fonts = 1

set background=dark
set termguicolors
colorscheme onedark

" Git blamer config
"let g:blamer_enabled = 1
"let g:blamer_delay = 100

" Coc config
let g:coc_global_extensions = [
      \'coc-html',
      \'coc-pyright',
      \'coc-tsserver',
      \'coc-phpls',
      \]

" Autoformat on save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.js,*.html,*.xhtml,*.phtml'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" coc-go coc-html coc-css coc-json

"Nerdcommenter config
filetype plugin on 
map <leader>cc <plug>NERDCommenterToggle
