" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>













set nocompatible              " be iMproved, required
filetype off                  " required

set ttimeoutlen=10

if (has("termguicolors"))
  set termguicolors
endif

set rtp+=/usr/local/opt/fzf

"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

"call plug#begin()
"
"Plug 'iamcco/markdown-preview.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tpope/vim-fugitive'
"Plug 'w0rp/ale'
"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
"Plug '/usr/local/opt/fzf'
"Plug 'junegunn/fzf.vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
"Plug 'vim-airline/vim-airline'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'ruanyl/coverage.vim'
"
""Plug 'google/vim-maktaba'
""Plug 'google/vim-coverage'
"" Also add Glaive, which is used to configure coverage's maktaba flags. See
"" `:help :Glaive` for usage.
""Plug 'google/vim-glaive'
"
"
"Plug 'kaicataldo/material.vim'
"
"Plug 'vim-airline/vim-airline-themes'
"" All of your Plugins must be added before the following line
"call plug#end()            " required

"call glaive#Install()
"Glaive coverage plugin[mappings]
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_fixers = { 'javascript': ['eslint'] }

let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_sign_covered = '⦿'
let g:coverage_interval = 100
let g:coverage_show_covered = 0
let g:coverage_show_uncovered = 1

set cursorline
set title
set autoread
set noshowmode

"Setting misc settings"
syntax on
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=4
set smartindent
set ignorecase
set smartcase
set relativenumber
set wildmenu
set number
set list
set listchars=tab:?\ ,trail:.
map ; :Files<CR>
map ,, :ALEFix<CR>


" Palenight
let g:material_theme_style='palenight'
set background=dark
colorscheme material

"Fixing typos"
:command WQ wq
:command Wq wq
:command W w
:command Q q
:command B b
no Q <Nop>

"Disabling the arrow keys"
no <down> <Nop>
no <up> <Nop>
no <right> <Nop>
no <left> <Nop>
ino <down> <Nop>
ino <up> <Nop>
ino <right> <Nop>
ino <left> <Nop>
vno <down> <Nop>
vno <up> <Nop>
vno <right> <Nop>
vno <left> <Nop>


map <C-y> :NERDTreeToggle<CR>

" Dvorak remap
" " 1 - Movement keys htns -> hjkl
" "   (gj and gk move by visual lines, if the line is wrapped for instance)
"noremap h h
"noremap t gj
"noremap n gk
"noremap s l
"" " 2 - replace functions we remapped away
"" "   S goes to bottom of Screen
"noremap S L
"" "   j/J Jerk and replace a character/line
"noremap j s
"noremap J S
"" "   k/K Keep searching through regex matches
"noremap k n
"noremap K N
"" "   l/L Looks forward/backward to a 
"noremap l t
"noremap L T
"" "   T   puts lines Together
"noremap T J

"Mapping splitting settings"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
au GUIEnter * simalt ~x

"set lines=34
"set columns=150
set encoding=utf-8
"if has('gui_running')
  set guifont=ProggyCleanTT:h16:cANSI
"  set guifont=DejaVu_Sans_Mono_for_Powerline:h16:cANSI
"   set guifont=Anonymice_Powerline:h14:cANSI
"endif
set laststatus=2

"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:bufferline_active_buffer_left=''
let g:bufferline_active_buffer_right=''
"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
hi Normal guibg=NONE ctermbg=NONE
