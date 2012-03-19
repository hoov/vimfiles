set nocompatible                  " Must come first because it changes other options.

let mapleader=","

filetype off
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

syntax enable                     " Turn on syntax highlighting.
filetype on
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set showmatch                     " Briefly jump to a paren once its balanced
set matchtime=2                   " (for only .2 seconds)

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
" wildmenu ignores
set wildignore+=*.o,*.obj,.git,*.pyc

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set foldcolumn=1                  " Show the pretty fold column on the left.
set foldlevel=100                 " Don't fold automaticallhy, but let me do it when I want.
set cursorline                    " Hilight the current line

set tabstop=4                     " Global tab width.
set shiftwidth=4                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set autoindent

set clipboard=unnamed

set laststatus=2                  " Show the status line all the time
"
" Useful status information at bottom of screen
set statusline=
set statusline+=[%-3.3n]\                     " buffer number
set statusline+=%<%.99f\                      " filename
set statusline+=[%{strlen(&ft)?&ft:'none'},   " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},  " encoding
set statusline+=%{&fileformat}]               " file format
set statusline+=%h                            " help file flag
set statusline+=%m                            " modified flag
set statusline+=%w                            " preview flag
set statusline+=%r\                           " read only flag
set statusline+=%{fugitive#statusline()}\     " git status
if !has("windows")
    set statusline+=%{rvm#statusline()}\      " rvm info
end
set statusline+=%{exists('*CapsLockStatusline')?CapsLockStatusline():''} " caps lock
set statusline+=%=                            " right align
set statusline+=%-14.(%l/%L,%c%V%)\           " location
set statusline+=%P                            " percentage of file

set tags=./tags,tags,~/.extra_tags/java.tags

" Or use vividchalk
"colorscheme topfunky-light
colorscheme ir_black 

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
if has('win32') || has('win64')
    map <leader>v :e ~/_vimrc<CR><C-W>_
    map <silent> <leader>V :source ~/_vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
else
    map <leader>v :e ~/.vimrc<CR><C-W>_
    map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
endif

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" turn of hlsearch and update pyflakes on enter
au BufRead,BufNewFile *.py nnoremap <buffer><CR> :nohlsearch\|:call PressedEnter()<cr>
nnoremap <buffer><CR> :nohlsearch\|:call PressedEnter()<cr>

" clear the search buffer when hitting return and update pyflakes checks
function! PressedEnter()
    :nohlsearch
    if &filetype == 'python'
        :PyflakesUpdate
    end
endfunction

" pep8
let g:pep8_map='<leader>8'

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <leader>n :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen=0

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
if has('win32') || has('win64')
    map <leader>e :e <C-R>=expand("%:p:h") . "/" <cr>
else
    map <leader>e :e <C-R>=expand("%:p:h") . "\" <cr>
endif

" Ack
map <Leader>a <Esc>:Ack!<CR>
map <Leader>A <Esc>:Ack!

" taglist setup
if has('win32') || has('win64')
    let Tlist_Ctags_Cmd = 'ctags.exe'
else
    let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
endif
map <leader>T :TlistToggle<CR>
let g:Tlist_Close_On_Select = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 50

" minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Python setup
let python_highlight_all = 1
let python_space_errors = 1
autocmd FileType python setlocal expandtab autoindent foldmethod=indent "omnifunc=pythoncomplete#Complete

map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

let ropevim_vim_completion = 1
let ropevim_extended_complete = 1
let g:ropevim_autoimport_modules = ["os.*","traceback"]
imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>

python << EOF
import os
import sys
import vim

if "VIRTUAL_ENV" in os.environ:
    project_base_dir = os.environ["VIRTUAL_ENV"]
    sys.path.insert(0, project_base_dir)
    bindir = "Scripts" if sys.platform.startswith("win") else "bin"

    activate_this = os.path.join(project_base_dir, bindir, "activate_this.py")

    execfile(activate_this, dict(__file__=activate_this))

for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % p.replace(" ", r"\ "))
EOF

" Cucumber setup
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab foldmethod=syntax
autocmd FileType cucumber setlocal shiftwidth=2 tabstop=2 expandtab

" Java
let g:java_highlight_all=1
let g:java_space_errors=1
let g:java_highlight_debug=1

" HTML/CSS/JS
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType js setlocal shiftwidth=2 tabstop=2 expandtab

