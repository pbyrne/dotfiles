alias b='bundle'
alias be='bundle exec'

# run each spec on its own (to verify that all dependencies are set up correctly, without requiring a global require-all-files setup step
alias solospec='git ls | grep _spec.rb | while read specfile; do echo testing $specfile; bundle exec rspec $specfile; done'
# and rake
alias r='trybin rake'

function trybin() {
  local bin="$1"
  local args=${*#${1}} # optional
  local cmd

  if [ -z $bin ]; then
    echo 'Must provide a bin to try: `trybin foo`'
  elif [ -f "bin/$bin" ]; then
    cmd=bin/$bin
  else
    cmd="bundle exec $bin"
  fi

  if [ -z ${args// } ]; then # trim whitespace out of the value
    echo "$cmd"
    eval "$cmd"
  else
    echo "$cmd $args"
    eval "$cmd $args"
  fi
}

alias ra='trybin rails'
alias rc='trybin rails console'
alias rs='trybin rails server'

