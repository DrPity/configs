# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="apple"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

WHITE=$'\033[1;37m'
BLUE=$'\033[1;34m'
GREEN=$'\033[0;32m'
ORANGE=$'\033[0;33m'
NO_COLOUR=$'\033[0m'

alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
alias ll='ls -la'
alias lg='ls -la | grep'
alias pipe='tee ~/Desktop/terminal.txt'
alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias bashreload='. ~/.bash_profile'
alias qfind="find . -name "
alias make1mb='mkfile 1m ./1MB.dat'
alias make5mb='mkfile 5m ./5MB.dat'
alias make10mb='mkfile 10m ./10MB.dat'
alias ttop="top -R -F -s 10 -o rsize"
alias myip='curl http://ipecho.net/plain; echo'
alias netcons='lsof -i'
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'
alias serve='python -m SimpleHTTPServer'

findPid () { lsof -t -c "$@" ; }
info() {
     echo -e "\nYou are logged on ${ORANGE}$HOST ${NO_COLOUR}"
     echo -e "\nAdditionnal information:$NC ${NO_COLOUR}" ; uname -a
     echo -e "\n${ORANGE}Users logged on:$NC ${NO_COLOUR} " ; w -h
     echo -e "\n${ORANGE}Current date :$NC ${NO_COLOUR} " ; date
     echo -e "\n${ORANGE}Machine stats :$NC ${NO_COLOUR} " ; uptime
     echo -e "\n${ORANGE}Current network location :$NC ${NO_COLOUR} " ; scselect
     echo -e "\n${ORANGE}Public facing IP Address :$NC ${NO_COLOUR}"; myip
    #  echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
     echo
 }

 #   Get my ip --------------------------------------
function get_ip() {
  getIp="$(ipconfig getifaddr en0)"
  if [ -z "$getIp" ]
  then
    echo $"127.0.0.1"
  else
    echo ${getIp}
  fi
}

function flip_table() {
  es=$?
  if [[ $es -eq 0 ]]; then
    echo "$BLUE ( °—°)   ┬──┬ "
  else
    echo "$ORANGE (╯°□°)╯︵┻━┻ "
  fi
}

get_exit_status() {
   es=$?
   if [[ $es -eq 0 ]]; then
       echo "${GREEN}${es}${NONE}"
   else
       echo "${RED}${es}${NONE}"
   fi
}

# Show current git branch
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT='flipTable=$(flip_table) ip=$(get_ip)'

PS1='%{$BLUE%}[%{$WHITE%}%D{%H:%M}%{$BLUE%}]-[%{$WHITE%}${PWD}%{$BLUE%}]-[%{$WHITE%}$(get_ip)%{$BLUE%}]%{$ORANGE%}$(parse_git_branch) => %{$WHITE%}'
# PS1='%{$BLUE%}[%{$WHITE%}%n%{$BLUE%}@%{$WHITE%}%m%{$BLUE%}]-[%{$WHITE%}$(get_ip)%{$BLUE%}]-[%{$WHITE%}${PWD}%{$BLUE%}][%{$WHITE%}%D{%H:%M}%{$BLUE%}]%{$ORANGE%}$(parse_git_branch) => %{$WHITE%}'

