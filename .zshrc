### zprof for debugging startup (uncomment line below and last line) ###
# zmodload zsh/zprof

 ##----------------------------##
##  /\_/\    ╭──────────────╮   ##
## ( o.o )  <  Zshhhhhhhh... )  ##
##  > ^ <    ╰──────────────╯   ##
 ##----------------------------##
# =============================================
#  1. Load Completion System FIRST(not in use)
# =============================================
# autoload -Uz compinit && compinit

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
zinit light zsh-users/zsh-completions
zicompinit
zicdreplay

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
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

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
source ~/.local/bin/construct

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
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
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

alias lg='lazygit'
alias ya='y'

alias multipull="find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;"
bindkey '^G' clear-screen
alias wt='glow "$(ls -1t --color=never ~/github/Project_Management_Test/weeks_2025_todo/2025_*.md | head -n 1)"'
alias we='nvim "$(ls -1t --color=never ~/github/Project_Management_Test/weeks_2025_todo/2025_*.md | head -n 1)"'

alias wtt='glow "$(ls -1t --color=never ~/github/master_plan_2025/week_at_glance/week_*.md | head -n 1)"'
alias wee='nvim "$(ls -1t --color=never ~/github/master_plan_2025/week_at_glance/week_*.md | head -n 1)"'


alias terminaldoom="~/github/terminal-doom && zig-out/bin/terminal-doom"
alias theconstruct="cd ~/theconstruct/"
alias cs="cd ~/theconstruct/"




# =============================================
# 13. FZF Configuration (smart in $HOME)
# =============================================

# Keybindings (use ONE)
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] \
  && source /usr/share/doc/fzf/examples/key-bindings.zsh

# --- What folders are "real work" when you're sitting in ~ ---
# Edit this list any time (add/remove folders you like)
FZF_HOME_DIRS=(
  "$HOME/dev"
  "$HOME/dotfiles"
  "$HOME/github"
  "$HOME/gitlab"
  "$HOME/Documents"
  "$HOME/Downloads"
  "$HOME/Pictures"
  "$HOME/Music"
  "$HOME/Videos"
  "$HOME/.config"
  "$HOME/Arduino"
)

# --- Excludes (apply everywhere) ---
FZF_FD_EXCLUDES=(
  --exclude .git
  --exclude .cache
  --exclude node_modules
  --exclude .venv
  --exclude venv
  --exclude __pycache__
  --exclude .local/share/Trash
  --exclude .wine
  --exclude bosewine
  --exclude dist-newstyle
)

# --- Smart command: if PWD is ~, search only in FZF_HOME_DIRS; otherwise search from PWD ---
_fzf_fd_files() {
  if [[ "$PWD" == "$HOME" ]]; then
    fd --type f --hidden --color=always "${FZF_FD_EXCLUDES[@]}" . "${FZF_HOME_DIRS[@]}"
  else
    fd --type f --hidden --color=always "${FZF_FD_EXCLUDES[@]}" .
  fi
}

_fzf_fd_dirs() {
  if [[ "$PWD" == "$HOME" ]]; then
    fd --type d --hidden --color=always "${FZF_FD_EXCLUDES[@]}" . "${FZF_HOME_DIRS[@]}"
  else
    fd --type d --hidden --color=always "${FZF_FD_EXCLUDES[@]}" .
  fi
}

# fzf uses these for Ctrl-T / Alt-C
export FZF_CTRL_T_COMMAND='_fzf_fd_files'
export FZF_ALT_C_COMMAND='_fzf_fd_dirs'

# If you run plain `fzf`, keep it useful too:
export FZF_DEFAULT_COMMAND='_fzf_fd_files'

# --- UI / preview ---
export FZF_DEFAULT_OPTS='
  --ansi
  --height 50%
  --border
  --layout=reverse
  --bind=ctrl-l:accept
  --preview "([[ -f {} ]] && batcat --style=numbers --color=always {}) || ([[ -d {} ]] && eza -lah --icons --color=always {})"
'
# --- History search ---
export FZF_CTRL_R_OPTS='--preview ""'



export NVM_DIR="$HOME/.config/nvm"
# --- Lazy-load NVM on first use (speeds up zsh startup) ---
_nvm_lazy_load() {
  unset -f nvm node npm npx pnpm yarn corepack 2>/dev/null

  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  # In zsh you usually do NOT need bash_completion; leave it off unless you know you need it.
  # [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
}

nvm()      { _nvm_lazy_load; nvm "$@"; }
node()     { _nvm_lazy_load; node "$@"; }
npm()      { _nvm_lazy_load; npm "$@"; }
npx()      { _nvm_lazy_load; npx "$@"; }
pnpm()     { _nvm_lazy_load; pnpm "$@"; }
yarn()     { _nvm_lazy_load; yarn "$@"; }
corepack() { _nvm_lazy_load; corepack "$@"; }


### zprof for debugging startup (uncomment line below and line nr. 2) ###
# zprof
