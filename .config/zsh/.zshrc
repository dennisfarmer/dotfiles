PATH="$PATH:/usr/local/mysql/bin"
alias coldbrew='arch --x86_64 /usr/local/Homebrew/bin/brew'

PATH="/opt/homebrew/bin:$PATH"
export VIMRC="$HOME/.config/nvim/init.vim"
export ZSHRC="$HOME/.config/zsh/.zshrc"
unsetopt autocd
# setopt noautocd


HISTSIZE=10000000
SAVEHIST=10000000
if [[ -z "$HISTFILE" ]]; then
    HISTFILE="$HOME/.cache/history/.zsh_history"
fi

if ! [[ -f "$HISTFILE" ]]; then
    echo "Creating zsh history file..."
    mkdir -p "${LOCAL_HISTORY:-$HOME/.cache/history}"
    touch $HISTFILE
fi


export ZSH="$HOME/.config/zsh/oh-my-zsh"
ZSH_THEME="cypher"
ZSH_CUSTOM="$ZSH/custom"

if ! [[ -d "$ZSH_CUSTOM/plugins/zsh-history-substring-search" ]]
then
    git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search
fi

if ! [[ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

if ! [[ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

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

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Load ls colors
if [[ -f ~/.dircolors ]] ; then
    eval $(dircolors -b ~/.dircolors)
fi

#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${DOT_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${DOT_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"
#




















export XDG_CONFIG_HOME="/Users/dennisfj/.config"
alias ls="ls -aG"

# python alias based on current environment
#pya() {
    #alias python="$(which python3)"
    #alias pip="$(which pip3)"
#}
#autoload -Uz pya


# note: might be acting weird with vscode (fix later)
# todo: set up sensible .vscode templates
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
alias vim="nvim"
