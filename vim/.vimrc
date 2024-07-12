if has("termguicolors")
  set termguicolors
endif

set background=dark
" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

" " MAPPINGS --------------------------------------------------------------- {{{

" Leader to space:
nnoremap <SPACE> <Nop>
let mapleader=" "

" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Mapping some f keys to compile / interprete python, ghc and java files
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>
nnoremap <f6> :w <CR>:!clear <CR>:!ghc % <CR>:!./%:r <CR>
nnoremap <f7> :w <CR>:!clear <CR>:!java % <CR>:!./%:r <CR>
nnoremap <f8> :w <CR>:!clear <CR>:!gcc % <CR>:!./a.out <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
set backspace=indent,eol,start
" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the leader + e key to toggle NERDTree open and close.
nnoremap <leader>e :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$', '\.mp3$', '\.flac$']

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'ayu-theme/ayu-vim'

Plug 'vim-syntastic/syntastic'

Plug 'preservim/nerdtree'

Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

Plug 'neovimhaskell/haskell-vim'

Plug 'alx741/vim-hindent'

Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

Plug 'aiya000/vim-ghcid-quickfix'

Plug 'prettier/vim-prettier'

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'easymotion/vim-easymotion'

Plug 'Raimondi/delimitMate'

Plug 'voldikss/vim-floaterm'

Plug 'svermeulen/vim-easyclip'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'christoomey/vim-system-copy'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ycm-core/YouCompleteMe'

call plug#end()

" }}}

" Floaterm autoclose: 0 - dont close; 1 - Close if job exits normally; 2 -
" always close
let g:floaterm_autoclose=1

" Set airline themes.
let g:airline_theme='distinguished'

" Set the snippet directories (optional)
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'my_snippets']

" Key mappings for UltiSnips
imap <silent> <C-j> <C-R>=UltiSnips#ExpandSnippet()<CR>
smap <silent> <C-j> <C-R>=UltiSnips#ExpandSnippet()<CR>

" Make clipboard silent
let g:system_copy_silent = 1

" Floaterm keybinds to make life easier
" Configuration example
let g:floaterm_keymap_new    = '<F1>'
let g:floaterm_keymap_toggle = '<F2>' 
let g:floaterm_keymap_kill   = '<Leader>k'

" which key display the binds
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=1000

" fzf maps
nnoremap <silent> <Space>f :Files<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Enable verbose logging for debugging
let g:test#verbose = 1

" 'mute' vim
set noerrorbells
set visualbell
set t_vb=

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set termguicolors
let ayucolor ="dark"
colorscheme ayu

highlight ALEVirtualTextError guifg=red
highlight ALEVirtualTextStyleWarning guifg=pink
highlight link ALEVirtualTextError Error

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Just to ensure kitty is running properly with VIM:
" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''
