" jpk's init.vim

" misc config ................................................................
set nocompatible " We don't want vi compat
set noshowmode   " vim-airline takes care of this, so hide default mode label

" vundle .....................................................................
set rtp+=~/.config/nvim/bundle/vundle/
call vundle#rc()
" bundles
Bundle 'gmarik/vundle'
"Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'airblade/vim-gitgutter'
Bundle 'szw/vim-maximizer'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-fugitive'
Bundle 'chrisbra/csv.vim'
Bundle 'rafi/vim-venom'
Bundle 'cespare/vim-toml'
" Bundle 'jelera/vim-javascript-syntax'
" Bundle 'pangloss/vim-javascript'
" Bundle 'Glench/Vim-Jinja2-Syntax'
" Bundle 'nono/vim-handlebars'
Bundle 'neovim/nvim-lspconfig'
Bundle 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Bundle 'nvim-treesitter/nvim-treesitter-refactor'
Bundle 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Bundle 'ray-x/navigator.lua'
Bundle 'ray-x/go.nvim'
Bundle 'ray-x/aurora'
Bundle 'sainnhe/edge'

" turn on mouse support ......................................................
set mouse=a

" set backup files to a central spot .........................................
set backup
set backupdir=~/.config/nvim/backups/
set dir=~/.config/nvim/backups/

" color scheme ...............................................................
syntax enable " Turn on syntax highlighting.
set t_Co=256 " Enable high-color
set termguicolors " 24-bit color! (Needed for new schemes but breaks old ones)

" don't let colorschemes change the background color
autocmd ColorScheme * hi Normal ctermbg=NONE guibg=NONE
" including the space after the end of the buffer
autocmd ColorScheme * hi EndOfBuffer ctermbg=NONE guibg=NONE
" override comment foreground color
autocmd ColorScheme * hi Comment guifg=#8cd9ff
" override TODO/FIXME in comments to be brighter
autocmd ColorScheme * hi Todo guibg=#5e1000 guifg=#FFCC22
" override search hit hi color when using termguicolors
autocmd ColorScheme * hi Search guifg=#333333 guibg=#FFCC22 gui=bold

" override vsplit divider color and fill char
autocmd ColorScheme * hi VertSplit guibg=#505559
autocmd ColorScheme * set fillchars+=vert:\   " set vsplit fill char to space

" Override the gitgutter sign column color
autocmd ColorScheme * hi SignColumn            guibg=NONE
autocmd ColorScheme * hi GitGutterAdd          guibg=NONE guifg=#00FF00 gui=bold
autocmd ColorScheme * hi GitGutterChange       guibg=NONE guifg=#FFFF00 gui=bold
autocmd ColorScheme * hi GitGutterDelete       guibg=NONE guifg=#FF0000 gui=bold
autocmd ColorScheme * hi GitGutterChangeDelete guibg=NONE guifg=#FF8800 gui=bold

colorscheme edge " This one supports tree-sitter stuff
"colorscheme desert256  " Old and trusty

" searching ..................................................................
set hlsearch " Highlight every occurrence of the last thing you searched for.
set incsearch " search while you type
set wrapscan " wrap searches that hit the start/end a file

" tabs and indention .........................................................
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab  " indent with spaces (lang-specific stuff may override this)

" Make gitgutter run less so it doesn't lag vim ..............................
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" 80 column ruler ...........................................................
" color background from column 80 to 500
" let &colorcolumn="80,".join(range(81,500),",")
" or, color just column 80
let &colorcolumn="80"
" this color
hi ColorColumn ctermbg=235

" status line (airline) ......................................................
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_detect_spell=0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_mode_map = {
  \ '__'    : '-',
  \ 'c'     : 'C',
  \ 'i'     : 'I',
  \ 'ic'    : 'I',
  \ 'ix'    : 'I',
  \ 'n'     : 'N',
  \ 'multi' : 'M',
  \ 'ni'    : 'N',
  \ 'no'    : 'N',
  \ 'R'     : 'R',
  \ 'Rv'    : 'R',
  \ 's'     : 'S',
  \ 'l'     : 'S',
  \ ''    : 'S',
  \ 't'     : 'T',
  \ 'v'     : 'V',
  \ 'V'     : 'V',
  \ ''    : 'V',
\ }


" spell checking .............................................................
set spell

" completion ................................................................
set completeopt-=preview " Dont show the scratch window while tabbing compls
hi Pmenu cterm=none ctermbg=17 ctermfg=grey
hi PmenuSel cterm=bold ctermbg=18 ctermfg=white

" ctrlp ......................................................................
let g:ctrlp_working_path_mode = 0 " ctrlp search relative to the project root
" ignore some stuff (would be nice to do this in a project-specific way, but
" until then there's this joint)
set wildignore+=
    \*.o,*.so,*.pyc,*.jar,*.class,*.dll,*.exe,
    \*/node_modules/*,*/.sass-cache/*,
    \*/dist/*,*/build/*,*/target/*,
    \.DS_Store,
" need to make ignoring version control metadata specific to ctrlp because
" putting it wildignore breaks things like vim-fugitive
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" ycm ........................................................................
let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 1000
let g:ycm_path_to_python_interpreter = substitute(
    \ system('which python3.10'),
    \ '\(python[0-9\.]*\).*',
    \ '\1',
    \ ''
\ ) " system() likes to put a null char at the end, the substitute() strips it
"let g:pythoncomplete_completions = 0

" line numbers ...............................................................
" Functions for toggling between relative, absolute, and no line numbers for
" all windows.
lua <<EOF
    function _G.line_nums_abs()
        vim.api.nvim_command('windo set number norelativenumber')
        vim.api.nvim_set_var('line_num_state', 'absolute')
    end

    function _G.line_nums_rel()
        vim.api.nvim_command('windo set nonumber relativenumber')
        vim.api.nvim_set_var('line_num_state', 'relative')
    end

    function _G.line_nums_off()
        vim.api.nvim_command('windo set nonumber norelativenumber')
        vim.api.nvim_set_var('line_num_state', 'off')
    end

    function _G.sync_win_line_nums_type()
        -- One of the line_nums_* functions above must be called to set the
        -- starting line number state so this doesn't blow up.
        local state = vim.api.nvim_get_var('line_num_state')
        if state == 'relative' then
            _G.line_nums_rel()
        elseif state == 'absolute' then
            _G.line_nums_abs()
        elseif state == 'off' then
            _G.line_nums_off()
        end
    end

    function _G.toggle_line_nums_type()
        -- One of the line_nums_* functions above must be called to set the
        -- starting line number state so this doesn't blow up.
        local state = vim.api.nvim_get_var('line_num_state')

        if state == 'relative' then
            print('🔒 Line numbers set to absolute')
            _G.line_nums_abs()
        elseif state == 'absolute' then
            print('⛔️ Line numbers set to off')
            _G.line_nums_off()
        elseif state == 'off' then
            print('🌊 Line numbers set to relative')
            _G.line_nums_rel()
        else
            print('Unknown line number state!')
        end

        return
    end
EOF

" Commands for setting global line number state
command LineNumsAbs lua line_nums_abs()
command LineNumsRel lua line_nums_rel()
command LineNumsOff lua line_nums_off()
command LineNumsSync lua sync_win_line_nums_type()
command LineNumsToggle lua toggle_line_nums_type()

" default to relative line numbers
:LineNumsRel

" Bind F6 to line number state toggle
map <F6> :LineNumsToggle<CR>

" tree-sitter ................................................................
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, anD YOu may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
EOF

" python stuff ...............................................................

" navigator ..................................................................
" Note that this also sets up lspconfig, so that plugin doesn't need any
" additional config.  (It would if I wasn't using navigator.)
lua <<EOF
require('navigator').setup({
    lsp = {
        format_on_save = false,
        code_action = {
            enable = false,
        },
    },
})
EOF

" golang setup ...............................................................
lua <<EOF
require 'go'.setup({
  goimport = 'gopls', -- if set to 'gopls' will use golsp format
  gofmt = 'gofmt', -- if set to gopls will use golsp format
  max_line_len = 80,
  comment_placeholder = '   ',
  lsp_cfg = true,
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- use on_attach from go.nvim
  --dap_debug = true,
})
local protocol = require'vim.lsp.protocol'
EOF
" Use tabs for indention in go files
autocmd BufReadPost *.go :set noexpandtab
" I don't use GoFmt on save, but this bind does a save then GoFmt
autocmd FileType go nnoremap <buffer> <C-Q> :write<CR> :silent! GoFmt<CR>
" Override GoDoc to use gopls, and invoke it with F9
autocmd FileType go command! GoDoc lua vim.lsp.buf.hover()
autocmd FileType go nnoremap <buffer> <F9> :GoDoc<CR>
" Override GoDef to use gopls, and invoke it with F8
autocmd FileType go command! GoDef lua vim.lsp.buf.definition()
autocmd FileType go nnoremap <buffer> <F8> :GoDef<CR>

" misc bindings ..............................................................
" Make Enter in normal mode save the file...
nnoremap <CR> :write <CR>
" ...but prevent that from messing up other stuff that uses enter
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" ...and if we use enter to save, this is good to break the :w muscle memory
" it may be commented out once enter-to-save is learned
"cabbrev w Yo, use Enter to save!
" map shift-tab to cycle through splits
map <S-Tab> <C-W><C-W>

" Map up and down arrow keys to gk and gj, which move by screen lines instead
" of file lines (Useful when soft wrapping is enabled)
map <Up> gk
map <Down> gj

" don't let neovim try to set the cursor shape ...............................
" (not all terminals support it, and those that don't will print garbage)
set guicursor=

" Save file as root if we didn't open vim with sudo.
cmap w!! w !sudo tee > /dev/null %

" Show the syntax highlighting group name for the thing under the cursor
" FIXME: This only works for vanilla highlighting, not tree-sitter stuff
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Shortcuts for base64 encode/decode, json formatting, and jwt decode
" These all operate on the whole buffer
command Jqp :set ft=json | %!jq
command Jqc :set ft=json | %!jq -c
command B64e :set ft=txt | %!base64 --wrap=0
command B64d :set ft=txt | %!base64 --decode
command Jwtd :%!jwt decode --json -
" Decode the whole buffer as a JWT and make the json pretty
function Jwtdp()
    :Jwtd
    :Jqp
endfunction
" Decode the whole buffer as a JWT but make the json compact
function Jwtdc()
    :Jwtd
    :Jqc
endfunction

" System Clipboard
" Put the whole buffer on the system clipboard (MacOS only)
command Pbcopy :w !pbcopy
command Pbpaste :%!pbpaste

" Un-escape (unix) newlines in a string (requires visual range selection)
command -range Nlrender :s/\\n/\r/g

