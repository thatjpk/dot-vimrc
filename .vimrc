" jpk's .vimrc

" misc config ................................................................
set nocompatible " We don't want vi compat
set pastetoggle=<F2> " bind pastetoggle to f2
" Hack to prevent vi and vim exit status on OS X from being 1.
filetype on 
filetype off
set hlsearch " Highlight every occurrence of the last thin you searched for.
set colorcolumn=80 " Paint the 80th column red as a line-wrapping guide
set completeopt-=preview " Dont show the scratch window while tabbing compls

" vundle .....................................................................
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" bundles
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'JavaScript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'Valloric/YouCompleteMe'
Bundle 'nono/vim-handlebars'

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
hi VertSplit ctermbg=17 ctermfg=8 cterm=none " set vsplit color
set fillchars+=vert:┆ " set vsplit fill char


" status line ................................................................
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
set wildignore+=.git,*.o,*.pyc,node_modules,.sass-cache,.tmp,temp,dist,blmapp/components

" ycm ........................................................................
let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 1000

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

