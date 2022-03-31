let maplocalleader = ','

"------------------
" Syntax and indent
"------------------
syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

filetype plugin indent on " enable file type detection
set autoindent

"---------------------
" Basic editing config by anishathalye
"---------------------
set shortmess+=I " disable startup message
set nu " number lines
set rnu " relative line numbering
set incsearch " incremental search (as string is being typed)
set hls " highlight search
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set lbr " line break
set scrolloff=5 " show lines above and below cursor (when possible)
set noshowmode " hide mode
set laststatus=2
set backspace=indent,eol,start " allow backspacing over everything
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set lazyredraw " skip redrawing screen in some cases
set autochdir " automatically set current directory to directory of last opened file
set hidden " allow auto-hiding of edited buffers
set history=8192 " more history
set nojoinspaces " suppress inserting two spaces between sentences
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" smart case-sensitive search
set ignorecase
set smartcase
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
set mouse+=a " enable mouse mode (scrolling, selection, etc)
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
set nofoldenable " disable folding by default

"--------------------
" Misc configurations
"--------------------

" unbind keys
"map <C-a> <Nop>
"map <C-x> <Nop>
"nmap Q <Nop>

" disable audible bell
"set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


"Basic vifm settings by MAKC
"set vicmd=nvim
"set syscalls
"set trash
"set nofollowlinks
"set sortnumbers
set undolevels=100
"set vimhelp
"set norunexec
"set tuioptions=u
"set timefmt=%m/%d\ %H:%M
"set wildmenu
"set wildstyle=popup
"set suggestoptions=normal,visual,view,otherpane,keys,marks,registers
set nohlsearch
"set slowfs=curlftpfs
set statusline="  Hint: %z%= %A %10u:%-7g %15s %20d  "

let t:is_transparent = 0                                                                        
function! Toggle_transparent_background()                                                       
  if t:is_transparent == 0                                                                      
    hi Normal guibg=#111111 ctermbg=black                                                       
    let t:is_transparent = 1                                                                    
  else                                                                                         
    hi Normal guibg=NONE ctermbg=NONE                                                           
    let t:is_transparent = 0                                                                    
  endif                                                                                         
endfunction                                                                                     
nnoremap <C-x><C-t> :call Toggle_transparent_background()<CR>

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" nerdtree- file tree system
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" buffergator- buffer navigator
Plug 'jeetsukumaran/vim-buffergator'

" gundo- better under
Plug 'sjl/gundo.vim'

" ctrlp- fuzzy file match search tool
Plug 'ctrlpvim/ctrlp.vim'

" easymotion- vim motion visual guide
Plug 'easymotion/vim-easymotion'

" incsearch- improved incremental search
Plug 'haya14busa/incsearch.vim'

" incsearch-easymotion- some combination plugin for the two
Plug 'haya14busa/incsearch-easymotion.vim'

" argwrap- wrapping/unwrapping functionality
Plug 'FooSoft/vim-argwrap'

" markdown- (vim-markdown??) markdown syntax highlighting and functions
Plug 'plasticboy/vim-markdown'

" syntastic- syntax checking plugin for vim
Plug 'vim-syntastic/syntastic'

" nord theme for nvim
Plug 'https://github.com/shaunsingh/nord.nvim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Nvim-R plugin
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

" Initialize plugin system
call plug#end()


"---------------------
" Plugin configuration
"---------------------
"
" buffergator- buffer navigator
let g:buffergator_suppress_keymaps = 1
nnoremap <Leader>b :BuffergatorToggle<CR>

" nerdtree- file tree system
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" gundo- better undo function
nnoremap <Leader>u :GundoToggle<CR>
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

" ctrlp- fuzzy file match search tool
" nnoremap ; :CtrlPBuffer<CR>
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1

" ack.vim- grep replacement <ack> plugin for vim
" syntastic- syntax checking plugin for vim
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': []
\}
nnoremap <Leader>s :SyntasticCheck<CR>
nnoremap <Leader>r :SyntasticReset<CR>
nnoremap <Leader>i :SyntasticInfo<CR>
nnoremap <Leader>m :SyntasticToggleMode<CR>

" easymotion- vim motion visual guide
map <Space> <Plug>(easymotion-prefix)

" incsearch- improved incremental search
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" incsearch-easymotion- some combination plugin for the two
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

" argwrap- wrapping/unwrapping functionality
nnoremap <Leader>w :ArgWrap<CR>

noremap <Leader>x :OverCommandLine<CR>

" markdown- (vim-markdown??) markdown syntax highlighting and functions
let g:markdown_fenced_languages = [
    \ 'bash=sh',
    \ 'c',
    \ 'coffee',
    \ 'erb=eruby',
    \ 'javascript',
    \ 'json',
    \ 'perl',
    \ 'python',
    \ 'ruby',
    \ 'yaml',
    \ 'go',
    \ 'racket',
    \ 'haskell',
    \ 'rust',
\]

