# quality of life
alias ll='ls -FlaG'
alias llg='ll | grep'
alias lc='wc -l'
alias du='du -hc'
alias psg='ps aux | grep -v grep | grep'

alias b='bundle'
# awesome spec rake task
alias s='bundle exec rake spec'
# stupid test:unit rake tasks
alias mktest='RAILS_ENV=test bundle exec rake db:create'
alias t='bundle exec rake test'
alias tu='bundle exec rake test:units'
alias tf='bundle exec rake test:functionals'
alias ti='bundle exec rake test:integration'
# and rake
alias r='bundle exec rake'
# and vagrant
alias bv='bundle exec vagrant'
alias v='vagrant' # TODO remove and switch bv to v once we get ngin onto rails 3.1 and can put vagrant back into the gemfile
# verify which ports an app runs on: e.g. ports mysqld
alias ports='sudo lsof -i -P | ack'

# create a tar file. usage: tarup filename.tar.gz directory/
alias tarup='tar -cvzf'
alias untar='tar -xvzf'

# terminitor gem
alias ts='terminitor start'

# clear out the **.orig files left over from opendiff's merges
alias rmorig="find . -name '*.orig' | xargs rm"
# clear out vim's temporary files
alias cleanvim='rm -f ~/.vim/_backup/* ~/.vim/_swp/* ~/.vim/_undo/*'

# don't want certain configuration choices when editing my crontab, so will check against VIM_CRONTAB in my .vimrc
alias crontab="VIM_CRONTAB=true crontab"

# git
alias g='git'

# alias hub to git for awesomeness https://github.com/defunkt/hub
# eval `hub alias -s bash 2> /dev/null`

# heroku
alias h='heroku'
# and kumade
alias k='bundle exec kumade'
alias kp='bundle exec kumade production'

# grep through history
alias hgrep='history | grep $1'

# go to the oh-my-zsh directory
alias zz='cd $ZSH'