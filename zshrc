#TERM=screen-256color
TERM=xterm-256color
#export LANG=en_US.UTF-8
export LS_COLORS=$LS_COLORS:'ow=1;34:';
export HISTFILE=$HOME/.config/zsh/.zsh_history
# 88x52 best halfscreen zoom term level
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# zshnameddirrc:
#hash -d cf=/home/dennis/.config
#hash -d cac=/home/lukesmith/.cache
#ash -d cf=/home/lukesmith/.config
#ash -d D=/home/lukesmith/Downloads
#ash -d d=/home/lukesmith/Documents
#ash -d dt=/home/lukesmith/.local/share
#ash -d rr=/home/lukesmith/.local/share
#ash -d h=/home/lukesmith
#ash -d m=/home/lukesmith/Music
#ash -d mn=/mnt
#ash -d pp=/home/lukesmith/Pictures
#ash -d sc=/home/lukesmith/.local/bin
#ash -d src=/home/lukesmith/.local/src
#ash -d vv=/home/lukesmith/Videos
#ash -d bf=/home/lukesmith/.config/shell/bm-files
#ash -d bd=/home/lukesmith/.config/shell/bm-dirs
#ash -d cfx=/home/lukesmith/.config/x11/xresources
#ash -d cfb=~/.local/src/dwmblocks/config.h
#ash -d cfv=/home/lukesmith/.config/nvim/init.vim
#ash -d cfz=/home/lukesmith/.config/zsh/.zshrc
#ash -d cfa=/home/lukesmith/.config/shell/aliasrc
#ash -d cfp=/home/lukesmith/.config/shell/profile
#ash -d cfm=/home/lukesmith/.config/mutt/muttrc
#ash -d cfn=/home/lukesmith/.config/newsboat/config
#ash -d cfu=/home/lukesmith/.config/newsboat/urls
#ash -d cfmb=/home/lukesmith/.config/ncmpcpp/bindings
#ash -d cfmc=/home/lukesmith/.config/ncmpcpp/config
#ash -d cfl=/home/lukesmith/.config/lf/lfrc
#ash -d cfL=/home/lukesmith/.config/lf/scope
#ash -d cfX=/home/lukesmith/.config/sxiv/exec/key-handler

# shortcutrc
# vim: filetype=sh
#alias cac="cd /home/lukesmith/.cache && ls -a" \
#cf="cd /home/lukesmith/.config && ls -a" \
#D="cd /home/lukesmith/Downloads && ls -a" \
#d="cd /home/lukesmith/Documents && ls -a" \
#dt="cd /home/lukesmith/.local/share && ls -a" \
#rr="cd /home/lukesmith/.local/share && ls -a" \
#h="cd /home/lukesmith && ls -a" \
#m="cd /home/lukesmith/Music && ls -a" \
#mn="cd /mnt && ls -a" \
#pp="cd /home/lukesmith/Pictures && ls -a" \
#sc="cd /home/lukesmith/.local/bin && ls -a" \
#src="cd /home/lukesmith/.local/src && ls -a" \
#vv="cd /home/lukesmith/Videos && ls -a" \
#bf="$EDITOR /home/lukesmith/.config/shell/bm-files" \
#bd="$EDITOR /home/lukesmith/.config/shell/bm-dirs" \
#cfx="$EDITOR /home/lukesmith/.config/x11/xresources" \
#cfb="$EDITOR ~/.local/src/dwmblocks/config.h" \
#cfv="$EDITOR /home/lukesmith/.config/nvim/init.vim" \
#cfz="$EDITOR /home/lukesmith/.config/zsh/.zshrc" \
#cfa="$EDITOR /home/lukesmith/.config/shell/aliasrc" \
#cfp="$EDITOR /home/lukesmith/.config/shell/profile" \
#cfm="$EDITOR /home/lukesmith/.config/mutt/muttrc" \
#cfn="$EDITOR /home/lukesmith/.config/newsboat/config" \
#cfu="$EDITOR /home/lukesmith/.config/newsboat/urls" \
#cfmb="$EDITOR /home/lukesmith/.config/ncmpcpp/bindings" \
#cfmc="$EDITOR /home/lukesmith/.config/ncmpcpp/config" \
#cfl="$EDITOR /home/lukesmith/.config/lf/lfrc" \
#cfL="$EDITOR /home/lukesmith/.config/lf/scope" \
#cfX="$EDITOR /home/lukesmith/.config/sxiv/exec/key-handler" \


export ZSH="/home/dennis/.oh-my-zsh"
ZSH_THEME="cypher"


setopt autocd  # auto cd into typed directories

# Prompt config:
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# bindkey -e  # emacs mode
bindkey -v # vi mode
export KEYTIMEOUT=1

# Auto complete with <tab>
autoload -U compinit
zstyle ':completion:*' menu select
#zstyle ':completion:*' ignored-patterns '(\./|\.\./)'
#zstyle ':completion:*' file-patterns '^(\.\./):source-files' '*:all-files'
zstyle ':completion:*:*:cd:*' menu yes select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

bindkey -s '^a' 'bc -lq\n'

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

#bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load syntax highlighting; should be last.
#source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

#----------------------------------------------------------------------------------------------
# Aliases

# General:
#alias ls='ls --all --almost-all --color -hN --group-directories-first'
alias ls='ls --all --color'
alias grep="grep --color=auto"
alias mkdir='mkdir -p'
alias wget='wget --no-hsts'
#alias pip='python -m pip'
alias jpn="jupyter lab --no-browser"
alias saml="source activate machine_learning"
alias vim="nvim"

# Scripting
# perl -MCPAN -e shell
# cpan [PACKAGE]

# ssh/onedrive/wsl
# alias sshpi='ssh pi@192.168.1.246'
# alias ods='onedrive --synchronize'
alias cdwin='cd /mnt/c/Users/denni'
#export git_token="$(cat ~/github/mastertoken.txt)"

# Washtenaw Community College USB Drive Shortcuts
alias wcc='cd /mnt/c/Users/denni/Downloads/coursework'
alias cps='cd /mnt/c/Users/denni/Downloads/coursework/cps272'
alias mp="cd /mnt/c/Users/denni/Downloads/coursework/cps272/00\ -\ Machine\ Problems"
alias phy='cd /mnt/c/Users/denni/Downloads/coursework/phy111'
alias mth='cd /mnt/c/Users/denni/Downloads/coursework/mth293'
alias cw='cd /mnt/c/Users/denni/Downloads/coursework'
alias mth160='cd /mnt/c/Users/denni/Downloads/coursework/MTH160'
alias coverl="cd /mnt/c/Users/denni/Downloads/coursework/internships/cover\ letter/Awesome-CV/examples"
alias cv="cd /mnt/c/Users/denni/Downloads/coursework/umich_summer_institute/cv"

# Bindings for obscure stuff
#alias spotify="flatpak run com.spotify.Client"
alias vish='vim ~/github/dotfiles/install.sh'
alias jsontool='python -m json.tool'
alias dsa='anaconda-navigator'

# conda activate [...] changes $HOST to "x86_64-conda_cos6-linux-gnu"
# https://github.com/conda/conda/issues/7031
# Conflicts with ZSH prompt, so reset with
# HOST=$(hostname)

# Data Science
# alias R='R --no-save'
# alias r='conda activate rstudio; HOST=$(hostname); clear; R --no-save'
# alias renv='conda activate rstudio; HOST=$(hostname); clear;'
# alias rstudio='conda activate rstudio; HOST=$(hostname); rstudio'
# alias base='conda activate; HOST=$(hostname); clear'

#----------------------------------------------------------------------------------------------
# History
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history


# Disable Ctrl-S freeze, Ctrl-Q unfreeze
if [[ -t 0 && $- = *i* ]]
then
    stty -ixon
fi

# Use Gvim to allow access to clipboard (probs change to neovim later idc)
if type gvim > /dev/null 2>&1; then
    alias vim="gvim -v"
    alias vi="gvim -v"
fi

# Python conda initialize
#__conda_setup="$('/home/dennisfarmer/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
    #eval "$__conda_setup"
#else
    #if [ -f "/home/dennisfarmer/anaconda3/etc/profile.d/conda.sh" ]; then
        #. "/home/dennisfarmer/anaconda3/etc/profile.d/conda.sh"
    #else
        #export PATH="/home/dennisfarmer/anaconda3/bin:$PATH"
    #fi
#fi
#unset __conda_setup

# Install Ruby Gems to ~/gems
# export GEM_HOME="$HOME/gems"
# export PATH="$HOME/gems/bin:$PATH"

# Fix home key error

#typeset -A key
#key=(
  #BackSpace  "${terminfo[kbs]}"
  #Home       "${terminfo[khome]}"
  #End        "${terminfo[kend]}"
  #Insert     "${terminfo[kich1]}"
  #Delete     "${terminfo[kdch1]}"
  #Up         "${terminfo[kcuu1]}"
  #Down       "${terminfo[kcud1]}"
  #Left       "${terminfo[kcub1]}"
  #Right      "${terminfo[kcuf1]}"
  #PageUp     "${terminfo[kpp]}"
  #PageDown   "${terminfo[knp]}"
#)

# Setup key accordingly
[[ -n "${key[BackSpace]}" ]] && bindkey "${key[BackSpace]}" backward-delete-char
[[ -n "${key[Home]}"      ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey "${key[End]}" end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n "${key[Delete]}"    ]] && bindkey "${key[Delete]}" delete-char
[[ -n "${key[Up]}"        ]] && bindkey "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}"      ]] && bindkey "${key[Down]}" down-line-or-beginning-search
[[ -n "${key[PageUp]}"    ]] && bindkey "${key[PageUp]}" beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[Home]}"      ]] && bindkey -M vicmd "${key[Home]}" beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -M vicmd "${key[End]}" end-of-line

# Load ls colors
if [[ -f ~/.dircolors ]] ; then
    eval $(dircolors -b ~/.dircolors)
fi

# Launch TMUX
# Tmux buggy in WSL, so commented out
export TMUXRC="$HOME/.config/tmux/tmux.conf"
#alias tmux="tmux -2 -f $TMUXRC"
alias fj="tmux -2 -f $TMUXRC attach -t 'anaconda' 2>/dev/null || tmux -2 -f $TMUXRC new -s 'anaconda' -n 'X230'"
alias jf="tmux new-window -t X230 -a -d -n WCC -c /mnt/c/Users zsh"

#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    #trap clear SIGINT
    #echo "Ctl-C to skip TMUX auto attach..."; sleep 0.2s && tmux attach -t "anaconda" 2>/dev/null || tmux new -s "anaconda" -n "X230"
    #clear
#fi

# Optional / testing tmux commands:
    #&& tmux new-window -d -n STATS -c "/mnt/c/Users/denni/Downloads/coursework/MTH160/R" "zsh"
    #echo "Ctl-C to skip TMUX auto attach..."; sleep 0.2s && tmux new-session -A -s "anaconda" -n "X200"
    #pgrep tmux >/dev/null && tmux set -g status off
    #tmux attach -t anaconda 2>/dev/null
# Run neofetch to flex on the normies
# neofetch
# $player
