
 ##----------------------------##
##  /\_/\    ╭──────────────╮   ##
## ( o.o )  <  Zshhhhhhhh... )  ##
##  > ^ <    ╰──────────────╯   ##
 ##----------------------------##
# =============================================
#  1. Load Completion System FIRST
# =============================================
autoload -Uz compinit && compinit

# =============================================
#  2. Load Zinit (Plugin Manager)
# =============================================
source ~/.local/share/zinit/zinit.git/zinit.zsh

# =============================================
#  3. Load Plugins via Zinit
# =============================================

# Syntax highlighting for better readability
zinit light zdharma-continuum/fast-syntax-highlighting

# Autosuggestions based on history
zinit light zsh-users/zsh-autosuggestions
bindkey '^l' autosuggest-accept

# Enhanced completion system
zinit wait lucid for \
    atload="zicompinit; zicdreplay" \
    zsh-users/zsh-completions

# FZF-powered tab completion
zinit light Aloxaf/fzf-tab
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-l:accept'

# =============================================
#  4. Enable Colors & Theming
# =============================================

export CLICOLOR=1
eval "$(dircolors -b ~/.config/lscolors/LS_COLORS)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' fzf-preview \
    '[[ -f $realpath ]] && batcat --color=always --style=numbers $realpath || ls --color=always $realpath'

zstyle ':completion:*' fzf-tab:complete use-icon-map yes

# =============================================
#  5. Export Environment Variables
# =============================================

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
. "$HOME/.cargo/env"

# Use batcat for man pages
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"

[[ $- == *i* ]] && stty -ixon

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim

# other
export PATH="$HOME/.platformio/penv/bin:$PATH"

# =============================================
#  6. Set Up Prompt & Tools
# =============================================

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# =============================================
#  7. History Settings
# =============================================

setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# =============================================
#  8. Auto-CD & Navigation
# =============================================

setopt auto_cd
alias b='cd ..'

# =============================================
#  9. Command Colors & Enhancements
# =============================================

alias grep='grep --color=auto'

# =============================================
# 10. LSD Aliases (Better LS)
# =============================================

alias la='lsd -Alh'
alias ls='lsd -aFh --color=always'
alias lx='lsd -lXBh'
alias lk='lsd -lSrh'
alias lc='lsd -ltcrh'
alias lu='lsd -lturh'
alias lr='lsd -lRh'
alias lt='lsd -ltrh'

alias lm='lsd -alh | more'
alias lw='lsd -xAh'
alias ll='lsd -Fls'
alias labc='lsd -lap'

alias lf="lsd -l | egrep -v '^d'"
alias ldir="lsd -l | egrep '^d'"

alias lla='lsd -Al'
alias las='lsd -A'
alias lls='lsd -l'

# =============================================
# 11. Functions
# =============================================

extract() {
    for archive in "$@"; do
        if [ -f "$archive" ]; then
            case $archive in
            *.tar.bz2) tar xvjf "$archive" ;;
            *.tar.gz) tar xvzf "$archive" ;;
            *.bz2) bunzip2 "$archive" ;;
            *.rar) rar x "$archive" ;;
            *.gz) gunzip "$archive" ;;
            *.tar) tar xvf "$archive" ;;
            *.tbz2) tar xvjf "$archive" ;;
            *.tgz) tar xvzf "$archive" ;;
            *.zip) unzip "$archive" ;;
            *.Z) uncompress "$archive" ;;
            *.7z) 7z x "$archive" ;;
            *) echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}

ftext() {
    grep -iIHrn --color=always "$1" . | less -R
}

mvg() { mv "$1" "$2" && cd "$2"; }
cpg() { cp "$1" "$2" && cd "$2"; }
mkdirg() { mkdir -p "$1" && cd "$1"; }

up() {
    local d=""
    limit=$1
    for ((i = 1; i <= limit; i++)); do d=$d/..; done
    d=$(echo $d | sed 's/^\///')
    cd ${d:-..}
}

# =============================================
# 12. Other Aliases
# =============================================

alias bat='batcat'

alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias apt-get='sudo apt-get'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias vi='nvim'
alias svi='sudo vi'
alias vis='nvim "+set si"'

alias home='cd ~'

alias multipull="find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;"
alias lg='lazygit'

alias terminaldoom="~/github/terminal-doom && zig-out/bin/terminal-doom"

bindkey '^G' clear-screen

# =============================================
# 13. FZF Configuration
# =============================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

export FZF_DEFAULT_COMMAND='find . -type f'
export FZF_DEFAULT_OPTS="--height 50% --border \
--bind=ctrl-l:accept \
--preview '[[ -f {} ]] && batcat --color=always {} || [[ -d {} ]] && ls -lh --color=always {}'"
export FZF_CTRL_R_OPTS='--preview ""'
