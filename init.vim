"
" Created by Pablo Triandafilide
" Email: pablotrianda@gmail.com
" NeoVim config

""
" =============EDITOR SETTINGS===================
"
""
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
set scrolloff=8
set ignorecase
set mouse=a
set cursorline
set autoread
set encoding=UTF-8
set clipboard+=unnamedplus
set termguicolors
filetype plugin on 
set splitbelow
set splitright

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

""
" =============PLUGINS===================
"
""
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'sebdah/vim-delve'
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'TimUntersberger/neogit'
"EditorConig
Plug 'editorconfig/editorconfig-vim'
" nvim-tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" Git diff 
Plug 'mhinz/vim-signify'
Plug 'ellisonleao/glow.nvim'
" Themes
Plug 'bluz71/vim-nightfly-guicolors'
" Vim be good(game)
Plug 'ThePrimeagen/vim-be-good'
Plug 'tpope/vim-fugitive'
" Vim Maximizer
Plug 'szw/vim-maximizer'


call plug#end()

" Theme settings nightfly
set background=dark
set t_Co=256
colorscheme nightfly 

""
" =============CONFING===================
"
""
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

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Fzf config
let g:fzf_layout = { 'window': { 'width':0.8, 'height':0.8}}
let $FZF_DEFAULT_OPTS='--reverse'

" Airline config
let g:airline_powerline_fonts = 1

" Coc config
let g:coc_global_extensions = [
      \'coc-html',
      \'coc-pyright',
      \'coc-tsserver',
      \'coc-go',
      \'coc-json',
      \]
      "\'coc-eslint',

" Autoformat on save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.js,*.html,*.xhtml,*.phtml'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

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

" Blamer
let g:blamer_delay = 10

let delimitMate_expand_cr = 1

""
" =============KEYMAPS===================
"
""

" Find files using Telescope and NvimTree config
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>E :NvimTreeFindFile   <CR>
nnoremap <leader>e :NvimTreeToggle   <CR>
" apt-get install silversearcher-ag
nnoremap <Leader>fw :Ag <C-R><C-W><CR>

" Move between splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>x :wincmd c<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Nerdcommenter 
map <leader>cc <plug>NERDCommenterToggle<CR>

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

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Copy current path file
nnoremap <leader>kp :let @*=expand("%")<CR>

" View all file on buffer
map  <leader>ob :Buffers<CR>

" NeoGit
nmap <leader>gs :Neogit<CR>

" Commands
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Format file with eslint
nmap <leader>f :CocCommand eslint.executeAutofix<CR>

" Move the lines with J and K
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

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


