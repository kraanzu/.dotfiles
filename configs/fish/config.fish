# -------SOURCE SECRETS-----------------
source $HOME/.config/fish/secrets.fish 2> /dev/null
source $HOME/.config/fish/utils.fish
source $HOME/.config/fish/quick_scripts.fish
source $HOME/.conda/etc/fish/conf.d/conda.fish 2> /dev/null

#----------------------------- BASICS -----------------------------------
fish_vi_key_bindings
fish_config theme choose Nord

set fish_greeting # Supresses fish's intro message
set TERM xterm-256color
set EDITOR nvim
set VISUAL nvim

#----------------------------- ALIASES --------------------------------

alias ..='cd ..'
alias ...='cd ../..'

alias vim='nvim'
alias tmux='tmux -u'
alias mv='mv -i'
alias rm='rm -rfi'
alias cp='cp -r'

alias ls='exa -F --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first' # all files and dirs
alias ll='exa -l --color=always --group-directories-first' # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias df='df -h | grep -e "^/dev"' # human-readable sizes
alias free='free -m' # show sizes in MB
alias yts='yt-dlp --extract-audio --audio-format opus' # download youtube video as mp3
alias cat='bat -pp --theme=Nord'
alias grep='grep --color=auto'
alias cb='xclip -selection clipboard'

export LANG=en_IN.UTF-8
export TERM=xterm-256color
export PYTHONDONTWRITEBYTECODE=1
export GOPATH=$HOME/.local/go
export IPYTHONDIR=~/.config/ipython
export NH_OS_FLAKE=/home/kraanzu/.dotfiles

# Extra programs
syncthing install-completions | source 2> /dev/null
zoxide init fish | source 2> /dev/null

starship init fish | source
