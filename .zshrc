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

# Enhanced completion system
zinit wait lucid for \
    atload="zicompinit; zicdreplay" \
    zsh-users/zsh-completions

# FZF-powered tab completion
zinit light Aloxaf/fzf-tab

# =============================================
#  4. Enable Colors & Theming
# =============================================

# Enable color support
export CLICOLOR=1

# Set custom directory and file colors
eval "$(dircolors -b ~/.config/lscolors/LS_COLORS)"

# Enable color for fzf-tab completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Enable file previews in FZF-tab (requires batcat & lsd)
zstyle ':completion:*' fzf-preview \
    '[[ -f $realpath ]] && batcat --color=always --style=numbers $realpath || ls --color=always $realpath'

# Enable Nerd Font icons (if applicable)
zstyle ':completion:*' fzf-tab:complete use-icon-map yes

# =============================================
#  5. Set Up Prompt & Tools
# =============================================

# Starship (fast, customizable prompt)
eval "$(starship init zsh)"

# Zoxide (smart directory jumping)
eval "$(zoxide init zsh)"

# =============================================
#  6. History Settings
# =============================================

# Avoid duplicate history entries
setopt histignorealldups sharehistory

# Set history limits
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# =============================================
#  7. Auto-CD & Navigation
# =============================================

# Enable changing directories by just typing folder names
setopt auto_cd

# Shortcut for navigating up one directory
alias b='cd ..'

# =============================================
#  8. Command Colors & Enhancements
# =============================================

# Enable colored output for grep
alias grep='grep --color=auto'

# =============================================
#  9. LSD Aliases (Better LS)
# =============================================

# Show hidden files
alias la='lsd -Alh'                

# Default ls replacement with colors
alias ls='lsd -aFh --color=always' 

# Sorting options
alias lx='lsd -lXBh'               # By extension
alias lk='lsd -lSrh'               # By size
alias lc='lsd -ltcrh'              # By change time
alias lu='lsd -lturh'              # By access time
alias lr='lsd -lRh'                # Recursive listing
alias lt='lsd -ltrh'               # By date

# Various listing styles
alias lm='lsd -alh | more'         # Paginate output
alias lw='lsd -xAh'                # Wide listing format
alias ll='lsd -Fls'                # Long listing
alias labc='lsd -lap'              # Alphabetical sort

# File/directory-only listings
alias lf="lsd -l | egrep -v '^d'"  # Files only
alias ldir="lsd -l | egrep '^d'"   # Directories only

# More listing styles
alias lla='lsd -Al'                # List & hidden files
alias las='lsd -A'                 # Hidden files
alias lls='lsd -l'                 # List

# =============================================
#  10. Other Aliases
# =============================================

alias bat='batcat'


# =============================================
#  11. config
# =============================================

# **fzf Configuration**
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh  # Enable fzf keybindings and completion
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh  # Enable fzf keybindings
export FZF_DEFAULT_COMMAND='find . -type f'
export FZF_DEFAULT_OPTS="--height 80% --border --preview 'if [ -d {} ]; then ls -lh --color=always {}; else batcat --color=always {}; fi'"



