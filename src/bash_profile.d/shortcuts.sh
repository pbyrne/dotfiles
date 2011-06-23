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

# terminitor gem
alias ts='terminitor start'

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

