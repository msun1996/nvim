" ==================== Editor behavior ====================
"set clipboard=unnamedplus
let &t_ut=''
set autochdir
set exrc
set secure
set number
"set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
"set list
"set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set visualbell
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block
"set mouse=a

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" =================== Operator =====================
nmap <C-S> :w!<CR>i
vmap <C-S> <C-C>:w!<CR>
imap <C-S> <Space><CR><ESC>:w!<CR>i
cmap <C-S> <Esc>:w!<CR>i 

nmap <C-Q> :q!<CR>
imap <C-Q> <ESC>:q!<CR>
cmap <C-Q> <Esc>:q!<CR>

" ==================== Buffer =======================
nnoremap b<Left> :bp<CR>
nnoremap b<Right> :bn<CR>
noremap bb :bn<CR>
nnoremap b- :bd<CR>


" ==================== Terminal Behaviors ====================
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert

" ==================== Window management ====================
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>

noremap ww :wincmd w<CR>
noremap w- :close<CR>

" ==================== Tab management ====================
" Create a new tab with tn
noremap <tab>= :tabe<CR>
noremap <tab>- :tabc<CR>
" Move around tabs with tn and ti
noremap <tab><Left> :-tabnext<CR>
noremap <tab><Right> :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap <tab>, :-tabmove<CR>
noremap <tab>. :+tabmove<CR>

noremap <tab><tab> :tabnext<CR>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" ==================== Install Plugins with Vim-Plug ====================
call plug#begin('$HOME/.config/nvim/plugged')

" 侧边导航 
Plug 'preservim/nerdtree'
" nerdtree 中显示 git 状态
Plug 'Xuyuanp/nerdtree-git-plugin'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
Plug 'SirVer/ultisnips'
Plug 'fatih/molokai'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" File navigation
" pre install https://github.com/BurntSushi/ripgrep#installation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" status line 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Easily identify bracket levels when editing
Plug 'luochen1990/rainbow'

call plug#end()

" ==================== coc.nvim ====================
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-yaml',
  \ 'coc-go',
  \ 'coc-explorer']

nmap <tab>e :CocCommand explorer<CR>

" ==================== FZF ====================

let g:fzf_preview_window = 'right:40%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }

noremap <silent> <C-f> :Rg<CR>


" ==================== vim-go ====================
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

let g:go_term_height = 30
let g:go_term_width = 30
let g:go_term_enabled = 1
let g:go_term_close_on_exit = 1

" molokai
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd Filetype go nnoremap gr :GoReferrers<CR>
autocmd Filetype go nnoremap gi :GoImplements<CR>
autocmd Filetype go nnoremap gc :GoCallees<CR>
autocmd Filetype go nnoremap ga :GoAlternate
autocmd Filetype go nnoremap gm :GoMetaLinter
autocmd Filetype go nnoremap gv :GoVet
autocmd Filetype go nnoremap gp :GoChannelPeers
autocmd Filetype go nnoremap fs :GoFillStruct<CR>
autocmd Filetype go nnoremap fk :GoKeyify<CR>
autocmd Filetype go nnoremap <leader>gd :GoDescribe<CR>
autocmd Filetype go nnoremap <leader>ce :GoCallees<CR>
autocmd Filetype go nnoremap <leader>cr :GoCallers<CR>
autocmd Filetype go nnoremap <leader>si :GoSameIdsToggle<CR>
autocmd Filetype go nnoremap <leader>ds :GoDefStack<CR>

"============= vim-airline ===========
let g:airline#extensions#tabline#enabled = 1

"============= Rainbow ================
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
