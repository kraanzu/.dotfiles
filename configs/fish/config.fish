# -------SOURCE SECRETS-----------------
source $HOME/.config/fish/secrets.fish  2> /dev/null
source $HOME/.config/fish/utils.fish
source $HOME/.config/fish/quick_scripts.fish


#--------CUSTOM FUNCTIONS---------------
fish_vi_key_bindings

#----------------------------- BASICS -----------------------------------
set fish_greeting # Supresses fish's intro message
set TERM xterm-256color # Sets the terminal type

set EDITOR nvim #Sets Editor to neovim
set VISUAL nvim

set fish_color_normal '#88C0D0'
set fish_color_autosuggestion '#B48EAD'
set fish_color_qouted '#EBCB8B'
set fish_color_command '#8FBCBB'
set fish_color_error '#BF616A'
set fish_color_param '#88C0D0'
set fish_color_keyword '#D8DEE9'

#----------------------------- ALIASES --------------------------------

#----DIRECTORY CHANGE
alias ..='cd ..'
alias ...='cd ../..'

alias vim='nvim'
alias tmux='tmux -u'
alias mv='mv -i'
alias rm='rm -rfi'

#----LS OUTPUT
alias ls='exa -F --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first' # all files and dirs
alias ll='exa -l --color=always --group-directories-first' # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# pacman and yay
alias pacman='sudo pacman'
alias pacsyu='sudo pacman -Syyu' # update only standard pkgs
alias yaysua='yay -Sua --noconfirm' # update only AUR pkgs
alias yaysyu='yay -Syu --noconfirm' # update standard pkgs and AUR pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck' # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages

# adding flags
alias df='df -h | grep -e "^/dev"' # human-readable sizes
alias free='free -m' # show sizes in MB
alias yts='yt-dlp --extract-audio --audio-format opus' # download youtube video as mp3

# Git Stuff
alias uncommit="git reset HEAD~1"
alias recommit="git commit --amend --no-edit"
alias editcommit="git commit --amend"

# GREP COLOR
alias grep='grep --color=auto'

export PYTHONDONTWRITEBYTECODE=1
export GOPATH=$HOME/.local/go

set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH  

export LANG=en_IN.UTF-8
export TERM=xterm-256color
starship init fish | source
direnv hook fish | source
