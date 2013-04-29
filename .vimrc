" jpk's .vimrc

" vundle .....................................................................
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" bundles
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'JavaScript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'ervandew/supertab'
" Bundle 'Valloric/YouCompleteMe'

" Set backup files to a central spot .........................................
set backup
set backupdir=~/.vim/backups
set dir=~/.vim/backups

" misc config ................................................................
set nocompatible " We don't want vi compat
set pastetoggle=<F2> " bind pastetoggle to f2
filetype on " Automatically detect file types.

" searching ..................................................................
set incsearch " search while you type
set wrapscan " wrap searches that hit the start/end a file

" tabs and indention .........................................................
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
" but do whatever a filetype plugin says, otherwise
filetype indent on

" color scheme ...............................................................
syntax enable " Turn on syntax highlighting.
set t_Co=256 " Enable high-color
colorscheme desert256 " Non-suck color scheme

" gvim config ................................................................
"set guioptions-=m " Remove menu bar
"set guioptions-=T " Remove toolbar

" ctrlp ......................................................................
let g:ctrlp_working_path_mode = 0 " ctrlp search relative to the project root
" ignore some stuff
set wildignore+=.git,*.pyc,node_modules,.sass-cache,.tmp,temp,dist,blmapp/components

" misc bindings .............................................................
" Make Enter save the file
nnoremap <CR> :write <CR>
cabbrev w Yo, use Enter to save!
" ctrl+arrow to move between panes (doesn't work, not sure why)
"map <ESC>[Oa <C-Up>
"map <ESC>[Ob <C-Down>
"map <ESC>[Oc <C-Left>
"map <ESC>[Od <C-Right>
"map! <ESC>[Oa <C-Up>
"map! <ESC>[Ob <C-Down>
"map! <ESC>[Oc <C-Left>
"map! <ESC>[Od <C-Right>
"noremap <silent> <C-Up> :wincmd k<CR>
"noremap <silent> <C-Down> :wincmd j<CR>
"noremap <silent> <C-Left> :wincmd l<CR>
"noremap <silent> <C-Right> :wincmd h<CR>

