#!/bin/bash

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/Users/DrPity/Development/android-sdk/platform-tools:$PATH"
export CLICOLOR=1
export ANDROID_HOME="/Users/DrPity/Development/android-sdk"
export BLOCKSIZE=1k
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;33'

HISTFILESIZE=10000000

eval "$(thefuck --alias)"

WHITE=$'\033[1;37m'
BLUE=$'\033[1;34m'
GREEN=$'\033[0;32m'
ORANGE=$'\033[0;33m'
NO_COLOUR=$'\033[0m'


# Function to display my ip
function get_ip() {
  getIp="$(ipconfig getifaddr en0)"
  if [ -z "$getIp" ]
  then
    echo $"127.0.0.1"
  else
    echo ${getIp}
  fi
}


# # Titelbar
# case $TERM in
#   xterm*|rxvt*)
#   TITLEBAR=$'¯\_(ツ)_/¯'
#   ;;
#   *)
#   TITLEBAR=""
#   ;;
# esac


function flip_table() {
  es=$?
  if [[ $es -eq 0 ]]; then
    echo ""
  else
    echo " (╯°□°)╯︵┻━┻ "
  fi
}

get_exit_status(){
   es=$?
   if [ $es -eq 0 ]
   then
       echo -e "${GREEN}${es}${NONE}"
   else
       echo -e "${RED}${es}${NONE}"
   fi
}

PROMPT_COMMAND='flipTable=$(flip_table) ip=$(get_ip)'

#   Custom bash --------------------------------------

PS1='\[$BLUE\][\
\[$WHITE\]\u\[$BLUE\]@\[$WHITE\]\h\[$BLUE\]]-[\[$WHITE\]\[$ip\]\[$BLUE\]]-[\[$WHITE\]\[${PWD}\]\[$BLUE\]]\[$ORANGE\]\[${flipTable}\]\[$BLUE\]
[\[$WHITE\]\D{%H:%M}\[$BLUE\]]\[$ORANGE\]\[$(parse_git_branch)\] => \[$WHITE\]'

PS2='\[$BLUE\][\
\[$WHITE\]\u\[$BLUE\]@\[$WHITE\]\h\[$BLUE\]]\[$ORANGE\] => '


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



#   Some Aliases --------------------------------------

alias ll='ls -la'
alias lg='ls -la | grep'
alias DT='tee ~/Desktop/terminal.txt'
alias kogniHome='cd /Users/DrPity/Workspace/KogniHome/'
alias frontend='cd /Users/DrPity/Workspace/KogniHome/kognihome-tp1.kognichef-frontend/'
alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias bashreload='. ~/.bash_profile'
alias qfind="find . -name "
alias make1mb='mkfile 1m ./1MB.dat'
alias make5mb='mkfile 5m ./5MB.dat'
alias make10mb='mkfile 10m ./10MB.dat'
alias ttop="top -R -F -s 10 -o rsize"
alias myip='curl ip.appspot.com -w "\n"'
alias netCons='lsof -i'
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#   Web Dev --------------------------------------

httpHeaders () { /usr/bin/curl -I -L $@ ; }
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }
alias localServer='python -m SimpleHTTPServer'
alias webServer='ssh tk1ll3r@deneb.uberspace.de'

#   More Stuff --------------------------------------

zipf () { zip -r "$1".zip "$1" ; }
ql () { qlmanage -p "$*" >& /dev/null; }
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }
findPid () { lsof -t -c "$@" ; }
info() {
     echo -e "\nYou are logged on ${RED}$HOST"
     echo -e "\nAdditionnal information:$NC " ; uname -a
     echo -e "\n${RED}Users logged on:$NC " ; w -h
     echo -e "\n${RED}Current date :$NC " ; date
     echo -e "\n${RED}Machine stats :$NC " ; uptime
     echo -e "\n${RED}Current network location :$NC " ; scselect
     echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    #  echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
     echo
 }
