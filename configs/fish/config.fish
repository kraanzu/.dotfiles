# -------SOURCE SECRETS-----------------
source $HOME/.config/fish/secrets.fish 2> /dev/null
source $HOME/.config/fish/utils.fish
source $HOME/.config/fish/quick_scripts.fish

#--------CUSTOM FUNCTIONS---------------
fish_vi_key_bindings

#----------------------------- BASICS -----------------------------------
set fish_greeting # Supresses fish's intro message
set TERM xterm-256color # Sets the terminal type

set EDITOR nvim #Sets Editor to neovim
set VISUAL nvim

fish_config theme choose Nord

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

# adding flags
alias df='df -h | grep -e "^/dev"' # human-readable sizes
alias free='free -m' # show sizes in MB
alias yts='yt-dlp --extract-audio --audio-format opus' # download youtube video as mp3


# GREP COLOR
alias grep='grep --color=auto'

export PYTHONDONTWRITEBYTECODE=1
export GOPATH=$HOME/.local/go
export IPYTHONDIR=~/.config/ipython

set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin

export LANG=en_IN.UTF-8
export TERM=xterm-256color

# Extra programs
syncthing install-completions | source 2> /dev/null

starship init fish | source
