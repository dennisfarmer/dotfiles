set nocompatible

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
"Plug 'jalvesaq/Nvim-R'
Plug 'junegunn/goyo.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" R plugins
"Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

"Plug 'ncm2/ncm2'
"Plug 'gaalcaras/ncm-R'

"Plug 'sirver/UltiSnips'
"Plug 'ncm2/ncm2-ultisnips'
"Plug 'chrisbra/csv.vim'

" MATLAB plugin
"Plug 'daeyun/vim-matlab'

" Optional: better Rnoweb support (LaTeX completion)
Plug 'lervag/vimtex'


"Plug 'sheerun/vim-polyglot'
"Plug 'preservim/nerdtree'  " run with :NERDTree
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'preservim/nerdcommenter'
"Plug 'ap/vim-css-color'
"Plug 'vimwiki/vimwiki'
"Plug 'arcticicestudio/nord-vim'
"Plug 'morhetz/gruvbox'
"Plug 'kaicataldo/material.vim', { 'branch': 'main' }
"Plug 'altercation/vim-colors-solarized'
"Plug 'lervag/vimtex'
"Plug 'vimwiki/vimwiki'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-commentary'
" Vim-airline
" Plug 'vim-airline/vim-airline'
call plug#end()
filetype plugin indent on

" Note: https://stackoverflow.com/questions/35390415/cursor-jump-in-vim-after-save

let g:python3_host_prog="/usr/local/bin/python3"

":PlugInstall to install the plugins
":PlugUpdate to install or update the plugins
":PlugDiff to review the changes from the last update
":PlugClean to remove plugins no longer in the list

" -----------------------------------------------
"  R: ~/.vim/ftplugin/r.vim

" Object Browser
" \ro


" remapping the basic :: send line
"nmap , <Plug>RDSendLine
" remapping selection :: send multiple lines
"vmap , <Plug>RDSendSelection
" remapping selection :: send multiple lines + echo lines
"vmap ,e <Plug>RESendSelection
"help key-notation
"nmap <C-Bslash> <Plug>RSendFile



"nmap <C-Bslash> <Plug>RDSendLine
"vmap <C-Bslash> <Plug>REDSendSelection


" look in to using snippets
" find easy sub for %in% word

autocmd FileType r inoremap <buffer> > <ESC>:normal! a%>%<CR>a
autocmd FileType rmd inoremap <buffer> > <ESC>:normal! a%>%<CR>a

"autocmd FileType r inoremap <buffer> >> <ESC>:normal! a%>%<CR>a

"autocmd FileType r inoremap <buffer> < <ESC>:normal! a<-<CR>a

"autocmd FileType r inoremap <buffer> << <ESC>:normal! a<<<CR>a
"tnoremap > <SPACE>%>%




" -----------------------------------------------
" NVIM-R

nnoremap <buffer> <Leader>t :term matlab -nodesktop<CR>

" rbinds

" see 4.1. Key bindings

" \rl: runs ls()
" \rh help (gives option to select if function/etc. exists in more
"               than one library, very cool!)
" \re example
" \rv view dataframe (with csv.vim viewer)
" \o render output of current line as comments underneath (inline)
" \rs summary()
" \rg plot()
" \ra args()
" \rd setwd()
" \rp print()
" \rn names()
" \ao runs R CMD BATCH --no-restore --no-save, then opens .Rout file in new tab
" to open in new split window instead: let R_routnotab = 1
" \xx toggle comment
" \pp sends current paragraph (chunk not broken by empty line)
" \ae sends entire file
" \rv View data.frame in new tab
" Ctrl-X Ctrl-o complete object name

" \ch Run Chunks (from first to curr)
" \ca run chunk (cur, echo, down)


" figure out how functions with EOF python pipes work lol
"source $SCRIPTS/vim/Rbinds.vim


"filter groupby summarize

" see Nvim-R-quick-setup
" <LocalLeader> is '\' by default

" help page 6.1. Start R automatically (still reading)
" help nvim-r

let R_nvim_wd = 0
" use visidata to view data.frames and matrices
" can also use LibreOffice Calc or equivalent, let ... = 'localc' (name of prog, can use direct path too)
"let R_csv_app = 'terminal:vd'
"let R_csv_app = 'terminal:tablign'
"let R_csv_app = 'moderncsv'
let R_csv_delim = '\t'
let g:csv_delim='\t'
let g:csv_default_delim='\t'


"There is also the option of configuring Nvim-R to run an R command to
"display the data. Examples:
"let R_df_viewer = "relimp::showData(%s, font = 'Courier 14')"
"let R_df_viewer = "View(head(%s, n=100), title = deparse(substitute(%s)))"
let R_df_viewer = "View(head(%s, n=100))"

"The value of R_df_viewer is a string and the substring `%s` is replaced by the
"name of the object under the cursor.

" tmux (results in encoding errors)
"let R_source = "/home/dennisfj/.config/nvim/plugged/Nvim-R/R/tmux_split.vim"
let R_assign = 0
"let R_notmuxconf = 1

"let R_auto_start = 1
" let R_objbr_auto_start = 1
let R_commented_lines = 1
let R_openpdf = "okular"
let R_openhtml = "firefox"
let R_args = ['--no-save', '--quiet']
let Rout_more_colors = 1
let R_rcomment_string = '# '
let R_indent_commented = 0
let R_listmethods = 1
"let R_clear_console = 0

"If you want to press <C-Enter> to send lines to R, see:
"https://github.com/jalvesaq/Nvim-R/issues/64

autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif

" Use Ctrl+Space to do omni completion:
"if has('nvim') || has('gui_running')
	"inoremap <C-Space> <C-x><C-o>
"else
	"inoremap <Nul> <C-x><C-o>
"endif

" Press the space bar to send lines and selection to R:
"vmap <Space> <Plug>RDSendSelection
vmap <Space> <Plug>REDSendSelection
nmap <Space> <Plug>RDSendLine


"If you want to run RStudio instead of R set in your |vimrc| the value of
"`RStudio_cmd` to the complete path of the RStudio_cmd binary. Example:
">
   "let R_external_term = 1
   "let RStudio_cmd = 'C:\Program Files\RStudio\bin\rstudio'
"<
"Note: You must manually run a successful comand in RStudio Console before
"sending code from Vim to RStudio. The command might be something as simple as
"the number `1`.

" for omni completion
"let R_start_libs = 'base,stats,graphics,grDevices,utils,methods'

"let R_in_buffer = 0

let R_auto_start = 1
" let R_auto_start = 2
" let R_path = '/usr/bin/R'  <- might be different
" let Rout_more_colors = 1
" let R_nvim_wd = 1
" let R_external_term = 1

"View function args in the statusline, very useful if you don't want to use the args autocomplete (<C-X><C-A>)
"let R_args_in_stline = 1
" no longer exists

" Auto-start autocompletion inside data frames
autocmd filetype r inoremap $ $<C-X><C-O>

" for vim-pandoc
" (also look into vim-pandoc-syntax)
" syntastic for code linting
" YouCompleteMe for autocompletion
"let g:pandoc#filetypes#handled = ["rmarkdown"]
"let g:pandoc#modules#enabled = ["folding", "bibliographies", "completion", "toc"]
"let g:pandoc#biblio#use_bibtool = 1

" -----------------------------------------------
" MATLAB-VIM
" term matlab -nodesktop



" -----------------------------------------------
" Visual

syntax enable
set encoding=utf-8
"set number relativenumber
set number
set showmode
set noswapfile

if ! isdirectory(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/backup/"'))
    echo "Creating backup directory..."
    silent !mkdir -p $HOME/.config/nvim/backup
endif

if ! isdirectory(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/swap/"'))
    echo "Creating swap directory..."
    silent !mkdir -p $HOME/.config/nvim/swap
endif

if ! isdirectory(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/undo/"'))
    echo "Creating undo directory..."
    silent !mkdir -p $HOME/.config/nvim/undo
endif

set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//
set viminfo+=n~/.cache/history/viminfo
set shada+=n~/.cache/history/viminfo
" set viminfo shada=!,'100,<50,s10,h
set history=1000
set autoread
"set go=a
set mouse=a
" map <ScrollWheelUp> <C-Y>
" map <ScrollWheelDown> <C-E>
set scrolloff=16
set cursorline
set wrap linebreak
" set nowrap
" set wrap! to toggle
" set nofoldenable "disable folding, normal mode zi to disable
set background=dark
"colorscheme gruvbox
"let g:material_theme_style = 'palenight'
"let g:material_terminal_italics = 1
"colorscheme material
"let g:solarized_termtrans = 1
"let g:solarized_termcolors=256

"colorscheme solarized
"colorscheme gruvbox

"silent! colorscheme gruvbox
" normally uses nord but what if no colorscheme?
"silent! colorscheme nord

set title
set cursorline!
set laststatus=0
"set number! relativenumber!
" -----------------------------------------------
"  remove background (allow transparency)
hi Normal guibg=NONE ctermbg=NONE


" -----------------------------------------------
" Powerline

"set laststatus=2
set t_Co=256

" -----------------------------------------------
" Airline Configuration

" see airline-predefined-parts
" see help statusline
"let g:airline_section_x = airline#section#create(['filetype'])
"let g:airline_section_y = airline#section#create(['ffenc'])
"let g:airline_section_z = '%l-%c/%L'
"let g:airline_section_gutter = '%=TIMBUK2 -'
"let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#vimtex#enabled = 1
"let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

"let g:airline_powerline_fonts = 1
"let g:airline#extensions#vimtex#left = "{"
"let g:airline#extensions#vimtex#right = "}"
" look into airline-tmuxline

" -----------------------------------------------
" Search

set ignorecase
set nohlsearch
"set hlsearch
"nnoremap <CR> :noh<CR><CR>
let mapleader="\<Space>"
"let mapleader=","
set lazyredraw

" -----------------------------------------------
" Search and Replace
" I to mark case sensitive

" -----------------------------------------------
" Tabs

"TODO set width for R to 2, everything else to 3 or 4 (was originally 4)

set ai
set tabstop=4
set softtabstop=4

" indentation
set shiftwidth=4
set shiftround

autocmd FileType r,rmd set tabstop=2
autocmd FileType r,rmd set softtabstop=2
autocmd FileType r,rmd set shiftwidth=2

" ctrl+v <tab> to insert actual \t character
" set noexpandtab
set expandtab
set list
set listchars=tab:\|-

" to enable tabs
" set noexpandtab
" set smarttab
" set list
" set listchars=tab:\|␉

" color column
" set colorcolumn=86
" highlight ColorColumn ctermbg=darkgray
" match ErrorMsg '\%>85v.\+'
" highlight ColorColumn ctermbg=darkgray
" highlight ColorColumn ctermbg=darkgray

" -----------------------------------------------
"  Comments

highlight Comment ctermfg=green

" -----------------------------------------------
"  Cursor

" SI = Insert Mode
" SR = Replace Mode
" EI = Normal Mode

" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" -----------------------------------------------
" Disable ex mode

" :<C-f>
map q: <NOP>
" ex
nnoremap Q <NOP>

" -----------------------------------------------
"  Splits

" sp / vsp [FILENAME]
"   Ctrl+w v to create split to the right (horizontal)
"   Ctrl+w s to create split on the bottom (vertical)
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" -----------------------------------------------
"  Tabs

map <leader>tn :tabnew<CR>
map <leader>tl :tabnext<CR>
map <leader>th :tabprevious<CR>
"map <leader>tm :tabmove
map <leader>tq :tabclose<CR>
map <leader>to :tabonly<CR>

" -----------------------------------------------
" Convienient Shortcuts

"map <C-p> :!chmod u+x %; "%:p"<CR>
"map <C-w> :set wrap!<CR>
" Shift+k to find man entry of current word

" -----------------------------------------------
"  NERDTree and Term open

nmap <F6> :NERDTreeToggle<CR>
map <F2> :belowright terminal<CR>

" -----------------------------------------------
" Clipboard

set clipboard+=unnamedplus

" Copy and paste to/from system register
"vnoremap <C-c> "+y
"inoremap <C-v> <C-r>+
"map <C-v> "+P

" Keep clipboard on exit
if executable("xclip")
	autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+'))
endif

" -----------------------------------------------

" :help key-notation
filetype indent on
filetype plugin on
"autocmd FileType python,r,rmd set breakindentopt=shift:4

" Spell check
" :set spell and :set nospell to toggle spellcheck on and off
" ]s and s[ to move back and forth misspelled words
" z= to correct current word
"setlocal spell
set nospell
" Ctrl+L corrects previous spelling mistake
inoremap <C-l> <c-g>u<Esc>[s1z=']a<c-g>u

"
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Check file in shellcheck:
map <leader>s :!clear && shellcheck -x %<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" Recompile dwmblocks on config edit.
	"autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }


" Function for toggling the bottom statusbar:
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" -----------------------------------------------
"  Goyo

" ENTER GOYO
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set -g status off
    silent !tmux resize-pane -Z
    "silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()

" EXIT GOYO
function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set -g status on
    silent !tmux resize-pane -Z
    "silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=16
  hi Normal guibg=NONE ctermbg=NONE
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
	  if b:quitting_bang
		  qa!
	  else
		  qa
	  endif
  endif
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Map movement keys for wrapped lines
noremap <silent> k gk
noremap <silent> j gj
onoremap <silent> j j
onoremap <silent> k k

" Toggle Goyo
" autocmd FileType markdown,text,latex,plaintex
nnoremap <buffer> <Leader>g :Goyo<CR>


let g:goyo_width = 106
" g:goyo_height 85
" g:goyo_linenr 0
" g:goyo_margin_top 4
" g:goyo_margin_bottom 4

" -----------------------------------------------
" LaTeX

let g:tex_flavor='latex'
" let g:vimtex_view_method='okular'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let conceallevel=1
let g:tex_conceal='abdmg'

" -----------------------------------------------
" Snippets
" Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" -----------------------------------------------
" Miscellaneous bindings

" command W w !sudo tee % > /dev/null
" :W sudo saves files
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> zq :q<CR>
nnoremap <silent> zw :update<CR>
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
"nnoremap zq :update<BAR>q<CR>



" autocmd FileType r nnoremap zr <ESC>O```{r}<ESC>}i```<ESC>



autocmd FileType r inoremap <buffer> > <ESC>:normal! a%>%<CR>a
