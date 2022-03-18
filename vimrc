set nocompatible
" change viminfo directory
"if !has('nvim')
    "set viminfo+=n~/.vim/viminfo
"endif

" -----------------------------------------------
" Plugins
" look into using junegunn/vim-plug instead
" of vundle
" Install with :PluginInstall
"   or vim +PluginInstall +qall
" Update with :PluginUpdate
" Clean with :PluginClean
" Lookup help with "help [Nvim-R]
"set rtp+=~/.vim/bundle/Vundle.vim
filetype off
filetype plugin on
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

let g:vundle#bundle_dir='~/.config/nvim/bundle/'
" Plugin Manager
Plugin 'VundleVim/Vundle.vim'


Plugin 'vim-airline/vim-airline'

" Programming
"Plugin 'sheerun/vim-polyglot'
"Plugin 'preservim/nerdtree'  " run with :NERDTree
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'jalvesaq/Nvim-R'
"Plugin 'preservim/nerdcommenter'
"Plugin 'ap/vim-css-color'

" Writing
Plugin 'junegunn/goyo.vim'
"Plugin 'vimwiki/vimwiki'

" Color schemes
Plugin 'arcticicestudio/nord-vim'
Plugin 'morhetz/gruvbox'
"Plugin 'kaicataldo/material.vim', { 'branch': 'main' }
"Plugin 'altercation/vim-colors-solarized'
"
" Unnwanted :(
"Plugin 'lervag/vimtex'
"Plugin 'vimwiki/vimwiki'
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-commentary'
" Vim-airline
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" let g:airline_theme='gruvbox'

call vundle#end()
filetype plugin indent on

" Copy parts of lukesmit vimrc (init.vim)
" Note: https://stackoverflow.com/questions/35390415/cursor-jump-in-vim-after-save

" -----------------------------------------------
" Visual

syntax enable
set encoding=utf-8
"set number relativenumber
set showmode
set noswapfile
"set backupdir=~/.vim/backup//
set backupdir=~/.config/nvim/backup//
"set directory=~/.vim/swap//
set directory=~/.config/nvim/swap//
"set undodir=~/.vim/undo//
set undodir=~/.config/nvim/undo//
set history=1000
set autoread
set go=a
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

set rtp+=$HOME/anaconda3/lib/python3.7/site-packages/powerline/bindings/vim/
"set laststatus=2
set t_Co=256

" -----------------------------------------------
" Search

set ignorecase
set nohlsearch
"set hlsearch
"nnoremap <CR> :noh<CR><CR>
"let mapleader="\<Space>"
let mapleader=","
set lazyredraw

" -----------------------------------------------
" Tabs

set autoindent
set tabstop=4
set softtabstop=4

" indentation
set shiftwidth=4
set shiftround

" ctrl+v <tab> to insert actual \t character
" set noexpandtab
set smarttab
set expandtab

" color column
" set colorcolumn=80
" highlight ColorColumn ctermbg=darkgray
" highlight ColorColumn ctermbg=darkgray

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
"  NERDTree and Term open

nmap <F6> :NERDTreeToggle<CR>
map <F2> :belowright terminal<CR>

" -----------------------------------------------
" Clipboard

set clipboard+=unnamedplus

" Copy and paste to/from system register
vnoremap <C-c> "+y
inoremap <C-v> <C-r>+
map <C-v> "+P

" Keep clipboard on exit
if executable("xclip")
	autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+'))
endif

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
" -----------------------------------------------
"  PROGRAMMING

" :help key-notation
filetype indent on
filetype plugin on
"autocmd FileType python,r,rmd set breakindentopt=shift:4


map <C-p> :!chmod u+x %; "%:p"<CR>
map <C-k> :set wrap!<CR>
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
"  R: ~/.vim/ftplugin/r.vim

" help page 6.1. Start R automatically (still reading)
" let R_rcomment+string = '# '
" let R_auto_start = 2
" let R_path = '/usr/bin/R'  <- might be different
" let R_args = ['--no-save']
" let Rout_more_colors = 1
" let R_nvim_wd = 1
" let R_external_term = 1

" -----------------------------------------------
" LaTeX

"let g:tex_flavor='latex'
" let g:vimtex_view_method='okular'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
"let conceallevel=1
"let g:tex_conceal='abdmg'

" -----------------------------------------------
" Miscellaneous bindings

" command W w !sudo tee % > /dev/null
" :W sudo saves files
map <C-n> :NERDTreeToggle<CR>
