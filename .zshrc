# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# ZSH_THEME="lalis"

alias python=python3
alias pip=pip3

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  last-working-dir
  copybuffer
  # systemd
  # colorize
  docker-compose
  # debian
  # ubuntu
  # npm
  # nvm
  # react-native
  # sudo
  # themes
  asdf
  tmux
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export REACT_EDITOR="codium"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="kak ~/.zshrc"

# alias ohmyzsh="mate ~/.oh-my-zsh"
eval $(thefuck --alias)
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$HOME/.ghcup/ghc/8.6.5/bin:$PATH"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Custom Exports
export SC_REC_DIR="$HOME/.local/share/SuperCollider/Recordings/"
# export TIDAL_BOOT_PATH="$HOME/git/dots/tidal/boot.tidal"
export TIDAL_BOOT_PATH="/home/tidal/boot.tidal"

# Record Screen (Vdeo only)
alias rec="ffmpeg -video_size 3840x2160 -framerate 25 -f x11grab -i :0.0 output.mp4"

alias recs="cd $SC_REC_DIR"
alias zc="kak ~/.zshrc"
alias refresh="source ~/.zshrc"
alias save="cd ~/git/config && bash ./scripts/updateconfig.sh reverse; cd $pwd"
alias pip=pip3

# Quality of life
alias short='xdg-open https://trello.com/b/xYvCoiBo/short'

# TODO: Change this to atom on ubuntu regolith, create .zshrc for ubuntu
alias config="codium ~/git/dots"

alias ff="~/.cabal/bin/feedforward 2> ~/err.txt"

if [ -d $HOME/.config/broot ]; then
	source $HOME/.config/broot/launcher/bash/br
fi

# NVM path
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Ganache GUI helper (remember to update version)
# alias ganache-gui="~/Downloads/software/ganache-2.4.0-linux-x86_64.AppImage"
alias ganache-gui="~/Downloads/software/ganache-*.AppImage"

alias devjam="tmux new-session -s jam \
  kak '~/art/test.tidal' \; \
  new-window 'sclang' \; \
  new-window 'cninjam jam.miniestereo.org:2049 -user anonymous:ghales -jack' \
  select-window -t 0"

# Run a Tidal Jam
alias jam="$HOME/git/dots/scripts/jam.sh"
alias uplearn="$HOME/git/dots/scripts/uplearn.sh"
alias versodev="$HOME/git/dots/scripts/versodev.sh"

# Dev a seg jam (WIP)
segjam(){
  echo $1
  jack_control start && \
  tmux new-session -s jam "zsh -c \"node --inspect target/js/compiled/segue.js $1\""\; \
    new-window "sclang"                                            \; \
    new-window "ghci -ghci-script %opt{tidal_boot_file}" \; \
    # new-window "cninjam jam.miniestereo.org:2049 -user anonymous:ghales -jack" \; \
    select-window -t 0
  jack_control exit
}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:~/.local/bin"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export JAM_PATH="$HOME/git/pieces"

alias bat=batcat
alias lg=lazygit
alias tidal="ghci -ghci-script $TIDAL_BOOT_PATH"
alias resolutionreset="xrandr --output eDP-1 --mode 1920x1080"
resolutionreset

# source /home/ghales/.config/broot/launcher/bash/br
export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH

eval "$(starship init zsh)"

source /home/ghales/.config/broot/launcher/bash/br
source /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh

# bun completions
[ -s "/home/ghales/.bun/_bun" ] && source "/home/ghales/.bun/_bun"

# bun
export BUN_INSTALL="/home/ghales/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
alias heroku=~/Downloads/heroku/bin/heroku