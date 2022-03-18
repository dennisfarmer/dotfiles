#TERM=screen-256color
TERM=xterm-256color
#export LANG=en_US.UTF-8
export LS_COLORS=$LS_COLORS:'ow=1;34:';
export HISTFILE=$HOME/.config/zsh/.zsh_history


# LUKE SMITH SHELL PROMPT
#autoload -U colors && colors	# Load colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
#setopt autocd		# Automatically cd into typed directory.
#stty stop undef		# Disable ctrl-s to freeze terminal.
#setopt interactive_comments

alias R="R --no-save"
# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history


#alias bundle_env="$HOME/.rbenv/shims/

# shift A while in edit mode to autocomplete greytext


# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"


export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cypher"
#ZSH_THEME=""


setopt autocd  # auto cd into typed directories

# Prompt config:
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

plugins=(git vi-mode zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

bindkey -v
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

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Load syntax highlighting; should be last.
#source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

#----------------------------------------------------------------------------------------------
# Aliases

# General:

# Scripting
# perl -MCPAN -e shell
# cpan [PACKAGE]


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

# Use Gvim to allow access to clipboard (currently using nvim instead)
#if type gvim > /dev/null 2>&1; then
    #alias vim="gvim -v"
    #alias vi="gvim -v"
#fi

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

# Load ls colors
if [[ -f ~/.dircolors ]] ; then
    eval $(dircolors -b ~/.dircolors)
fi

#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${DOT_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${DOT_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"
#
# neofetch
#clear
#fortune
