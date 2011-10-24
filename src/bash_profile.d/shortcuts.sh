# quality of life
alias grep='grep --color=auto'
alias ll='ls -FlaG'
alias llg='ll | grep'
alias lc='wc -l'
alias du='du -hc'
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'
alias psg='ps aux | grep'
# create a tar file. usage: tarup filename.tar.gz directory/
alias tarup='tar -cvzf'
alias untar='tar -xvzf'

# terminitor gem
alias ts='terminitor start'

# clear out the **.orig files left over from opendiff's merges
alias rmorig="find . -name '*.orig' | xargs rm"

# don't want certain configuration choices when editing my crontab, so will check against VIM_CRONTAB in my .vimrc
alias crontab="VIM_CRONTAB=true crontab"

# Fuzzy cd
# Usage:
#    cdf public
# Changes to repos-public directory.
# stolen from @topfunky (http://dpaste.org/P59h/)
 
function cdf() {
  cd *$1*/
}

# git
alias g='git'
# and include autocomplete for this shortcut
complete -o default -o nospace -F _git g

# alias hub to git for awesomeness https://github.com/defunkt/hub
# eval `hub alias -s bash 2> /dev/null`

# heroku
alias h='heroku'

