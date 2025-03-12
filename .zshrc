# Load Zinit
source ~/.local/share/zinit/zinit.git/zinit.zsh

# Plugins via Zinit
zinit light zdharma-continuum/fast-syntax-highlighting  # Fast syntax highlighting
zinit light zsh-users/zsh-autosuggestions               # Autosuggestions in the terminal
zinit wait lucid for \
    atload"zicompinit; zicdreplay" \
    zsh-users/zsh-completions                           # Enhanced completion

# Set up the prompt
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# History settings
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Keybindings
bindkey -e

# Auto-cd settings
setopt auto_cd

# Alias for navigation
alias b='cd ..'

# Enable colors for lsd and other commands
export CLICOLOR=1
eval "$(dircolors -b ~/.config/lscolors/LS_COLORS)"



# Grep color
alias grep='grep --color=auto'

# LSD Aliases
alias la='lsd -Alh'                # Show hidden files
alias ls='lsd -aFh --color=always' # Colored output
alias lx='lsd -lXBh'               # Sort by extension
alias lk='lsd -lSrh'               # Sort by size
alias lc='lsd -ltcrh'              # Sort by change time
alias lu='lsd -lturh'              # Sort by access time
alias lr='lsd -lRh'                # Recursive listing
alias lt='lsd -ltrh'               # Sort by date
alias lm='lsd -alh | more'         # Paginate output
alias lw='lsd -xAh'                # Wide listing format
alias ll='lsd -Fls'                # Long listing
alias labc='lsd -lap'              # Alphabetical sort
alias lf="lsd -l | egrep -v '^d'"  # Files only
alias ldir="lsd -l | egrep '^d'"   # Directories only
alias lla='lsd -Al'                # List & Hidden Files
alias las='lsd -A'                 # Hidden Files
alias lls='lsd -l'                 # List

