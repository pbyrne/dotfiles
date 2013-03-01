# quality of life
alias ll='ls -FlaG'
alias llg='ll | grep'
alias lc='wc -l'
alias du='du -hc'
alias psg='ps aux | grep -v grep | grep'

alias -g G='| grep'
alias -g GV='| grep -v'
alias -g M='| less'
alias -g L='| wc -l'
alias -g ONE="| awk '{ print \$1 }'"
alias -g TWO="| awk '{ print \$2 }'"
alias -g X="| xargs"
alias -g XRM="| xargs rm"

alias b='bundle'
alias be='bundle exec'
# awesome spec rake task
alias s='bundle exec rspec'
# run each spec on its own (to verify that all dependencies are set up correctly, without requiring a global require-all-files setup step
alias solospec='git ls | grep _spec.rb | while read specfile; do echo testing $specfile; bundle exec rspec $specfile; done'
# potentially awesome cucumber rake task
alias c='bundle exec rake cucumber'
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

alias ra='bundle exec rails'
alias rc='bundle exec rails console'
alias rs='bundle exec rails server'

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
alias bh='bundle exec heroku'
# and kumade
alias k='bundle exec kumade'
alias kp='bundle exec kumade production'

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
alias publicip='curl --silent http://ifconfig.me/'

# generate a sha checksum of a given file
alias sha='shasum'

# convenience wrappers  around curl
alias curl='curl --silent'
alias curlgz='curl --silent -H "Accept-Encoding: gzip,deflate"'

# fix duplicate entries in Open With
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
