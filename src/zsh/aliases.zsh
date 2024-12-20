# quality of life
alias ll='ls -FlaG'
alias llg='ll | grep'
alias lc='wc -l'
alias du='du -hc'
alias psg='ps aux | grep -v grep | grep'

alias -g G='| grep'
alias -g GV='| grep -v'
alias -g A='| ack'
alias -g AV='| ack -v'
alias -g M='| less'
alias -g L='| wc -l'
alias -g ONE="| awk '{ print \$1 }'"
alias -g TWO="| awk '{ print \$2 }'"
alias -g X="| xargs"
alias -g XRM="| xargs rm"
alias -g H="| head"
alias -g T="| tail"
alias -g WC="| wc"

alias -g PSGKILL="TWO | xargs -n1 kill"

# create a tar file. usage: tarup filename.tar.gz directory/
alias tarup='tar -cvzf'
alias untar='tar -xvzf'

# clear out the **.orig files left over from opendiff's merges
alias rmorig="find . -name '*.orig' | xargs rm"
# clear out vim's temporary files
alias cleanvim='echo Cleaning up Vim files…; find /tmp/.vim/{_backup,_swp,_undo} -type f | grep -v .gitkeep | xargs -I{} rm -v {}'

# don't want certain configuration choices when editing my crontab, so will check against VIM_CRONTAB in my .vimrc
alias crontab="VIM_CRONTAB=true crontab"

# git
alias g='git'

# alias hub to git for awesomeness https://github.com/defunkt/hub
# eval `hub alias -s bash 2> /dev/null`

# heroku
alias h='heroku'

# grep through history
alias hgrep='history 1 | grep $1'

# list jobs
alias j='jobs'
# foreground
alias f='fg'

# run a simple fileserver in current location
alias serve='python -mSimpleHTTPServer'

# parse and pretty-print some JSON
alias json='python -mjson.tool'

# capture my public IP address
# alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias publicip='curl -sS https://myipv4.p1.opendns.com/get_my_ip | jq -r .ip'

# generate a sha checksum of a given file
alias sha='shasum'

# convenience wrappers around curl
alias curl='curl -sS' # -s to silence progress bar when piping, -S to unsilence errors
alias curlgz='curl -sS -H "Accept-Encoding: gzip,deflate"'

# fix duplicate entries in Open With
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# list open UDP ports: ports udp
# list open TCP ports: ports tcp
alias ports='sudo netstat -tulanp'

# run faster tests!
alias rubytest='ruby -I test '

# send and receive files with netcat
# lifted from http://us2.campaign-archive2.com/?u=542a01cc849b6e2f33b5ada6f&id=4e347c6c35&e=06fe6d0bb6
# ex: sendfile 1.2.3.4 ~/Downloads/foo.txt
function sendfile() {
  ip=$1; file=$2;
  # send the contents of $file to $ip on port 5566
  nc $ip 5566 < $file
}

# ex: receivefile ~/Downloads/bar.txt
function receivefile() {
  file=$1;
  # listen on port 5566 and dump what you receive to $file
  nc -l 5566 > $file
}

# report the file extensions in your project
#
# 1. get list of files from git
# 2. get the filename by passing the list of files into basename
# 3. fetching only files with extensions (that have a dot)
# 4. splitting by dot and grabbing the last item
# 5. reporting from most frequent to least frequent occurrence
alias filextensions="g ls-files | xargs basename | grep '\.' | awk -F'.' '{ print \$(NF) }' | sort | uniq -c | sort -rn"

# zero out log files. mainly to conserve disk for local development
function trimlogs() {
  echo `du -hcs log | tail -n1 | awk '{ print $1 }'` of logs
  for file in $(ls log/*); do
    echo > $file
  done
  echo Now `du -hcs log | tail -n1 | awk '{ print $1 }'` of logs
}

function brewhaha() {
  brew update
  echo
  brew outdated
}

# List all open ports and the name of the process listening on it
# Lifted from https://x.com/seldo/status/1823126087423099192
function usedports() {
  sudo lsof -iTCP -sTCP:LISTEN -n -P | awk 'NR>1 {print $9, $1, $2}' | sed 's/.*://' | while read port process pid; do echo "Port $port: $(ps -p $pid -o command= | sed 's/^-//') (PID: $pid)"; done | sort -n
}

