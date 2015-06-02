" jpk's .vimrc

" misc config ................................................................
set nocompatible " We don't want vi compat
set pastetoggle=<F2> " bind pastetoggle to f2
" Hack to prevent vi and vim exit status on OS X from being 1.
filetype on 
filetype off
set hlsearch " Highlight every occurrence of the last thin you searched for.
set completeopt-=preview " Dont show the scratch window while tabbing compls

" vundle .....................................................................
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" bundles
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'Valloric/YouCompleteMe'
Bundle 'nono/vim-handlebars'
Bundle 'airblade/vim-gitgutter'
Bundle 'szw/vim-maximizer'
Bundle 'Glench/Vim-Jinja2-Syntax'

" turn on mouse support ......................................................
set mouse=a

" set backup files to a central spot .........................................
set backup
set backupdir=~/.vim/backups
set dir=~/.vim/backups

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

" override vsplit divider color and fill char
hi VertSplit ctermbg=17 ctermfg=8 cterm=none " set vsplit color
set fillchars+=vert:┆ " set vsplit fill char

" Override the gitgutter sign column color
hi SignColumn            ctermbg=235
hi GitGutterAdd          ctermbg=235 ctermfg=green  cterm=none
hi GitGutterChange       ctermbg=235 ctermfg=yellow cterm=none
hi GitGutterDelete       ctermbg=235 ctermfg=red    cterm=none
hi GitGutterChangeDelete ctermbg=235 ctermfg=red    cterm=none

" Make gitgutter run less so it doesn't lag vim
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" 80 column ruler ............................................................ 
" color background from column 80 to 500
let &colorcolumn="80,".join(range(81,500),",") 
" this color
hi ColorColumn ctermbg=235 

" status line ................................................................
" always show the statusline
set laststatus=2
" highlight groups for status line (overrides colorscheme)
hi StatusLine ctermbg=20 ctermfg=white cterm=bold
hi StatusLineNC ctermbg=19 ctermfg=grey cterm=none
" status line options
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " ascii value of current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" spell checking .............................................................
set spell 
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=none ctermbg=none
hi clear SpellCap
hi SpellCap cterm=underline ctermbg=none ctermfg=none
hi clear SpellRare

" Tab completion menu color ..................................................
hi Pmenu cterm=none ctermbg=17 ctermfg=grey
hi PmenuSel cterm=bold ctermbg=18 ctermfg=white

" gvim config ................................................................
"set guioptions-=m " Remove menu bar
"set guioptions-=T " Remove toolbar

" ctrlp ......................................................................
let g:ctrlp_working_path_mode = 0 " ctrlp search relative to the project root
" ignore some stuff (would be nice to do this in a project-specific way, but
" until then there's this joint)
set wildignore+=
    \.git/,.hg/,.svn/,
    \*.o,*.so,*.pyc,*.jar,*.class,*.dll,*.exe,
    \node_modules/,.sass-cache/,
    \dist/,build/,target/,
    \.DS_Store,

" ycm ........................................................................
let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 1000
let g:ycm_path_to_python_interpreter = substitute(
    \ system('which python'), 
    \ '\(python[0-9\.]*\).*', 
    \ '\1', 
    \ ''
\ ) " system() likes to put a null char at the end, the substitute() strips it

" misc bindings .............................................................
" Make Enter save the file
nnoremap <CR> :write <CR>
"cabbrev w Yo, use Enter to save! " Commented out because I've learned it
" map shift-tab to tab through splits
map <S-Tab> <C-W><C-W>
