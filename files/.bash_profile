#!/bin/bash

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/Users/DrPity/Development/android-sdk/platform-tools:$PATH"
# export PATH="/Development/android-sdk/platform-tools:/Development/android-sdk/tools:$PATH"
export PATH="/usr/local/sbin:$PATH"
export CLICOLOR=1
export ANDROID_HOME="/Users/DrPity/Development/android-sdk"
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
# export PATH=./node_modules/.bin:$PATH
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;33'

HISTFILESIZE=10000000

eval "$(_PLATFORMIO_COMPLETE=source platformio)"


WHITE="\[\033[1;37m\]"
ORANGE="\[\033[1;33m\]"
BLUE="\[\033[1;34m\]"
GREEN="\[\033[0;32m\]"
ORANGE="\[\033[0;33m\]"
NO_COLOUR="\[\033[0m\]"


# Function to display my ip
function get_ip() {
 getIp="$(ipconfig getifaddr en0)"
 if [ -z "$getIp" ];
 then
   echo $"127.0.0.1"
 else
   echo $getIp
 fi
}


# Titelbar
case $TERM in
   xterm*|rxvt*)
       TITLEBAR='\[\033]0;\u@\h:\w\007\]'
       ;;
   *)
       TITLEBAR=""
       ;;
esac


function flip_table() {
 [[ $? = 0 ]] && curErr='' || curErr='1'
 if [[ $curErr ]]; then # One error
   echo $' (╯°□°)╯︵┻━┻ '
 fi
}


PS1="$TITLEBAR\
$BLUE[\
$WHITE\u$BLUE@$WHITE\h\
$BLUE]-[\
$WHITE\$(get_ip)\
$BLUE]-[\
$WHITE\$PWD\
$BLUE]$ORANGE\$(flip_table)
$BLUE[\
$WHITE\D{%H:%M}$BLUE]$BLUE$NO_COLOR$ORANGE\$(parse_git_branch) => $NO_COLOUR"

PS2="$BLUE-$WHITE-$WHITE-$NO_COLOUR"

# Show current git branch
function parse_git_branch () {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}



# Some aliases
alias ll='ls -la'
alias lg='ls -la | grep'
alias kogniHome='cd /Users/DrPity/Workspace/KogniHome/'
alias frontend='cd /Users/DrPity/Workspace/KogniHome/kognihome-tp1.kognichef-frontend/'
alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias bashreload=". ~/.bash_profile"
alias localServer="python -m SimpleHTTPServer"
alias webServer="ssh tk1ll3r@deneb.uberspace.de"
