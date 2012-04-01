export PATH=~/Dropbox/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/:$DYLD_LIBRARY_PATH
export SHARED_WORKSPACE=~/workspace
# `vim` and `mvim` aren't working for me now with the automation scripts wrapping around hub and the like; until that's solved, falling back to textmate
export EDITOR='mate -w'
# in LION, needed this to compile ruby 1.8.7
export CC=/usr/bin/gcc-4.2
export NODE_PATH=/usr/local/lib/node_modules
export GREP_OPTIONS='--color=auto'

# for more info, http://git.kernel.org/?p=git/git.git;a=blob;f=contrib/completion/git-completion.bash;hb=HEAD
# __git_ps1 flags
# show * if there are untracked changes and + if staged and uncommitted changes
GIT_PS1_SHOWDIRTYSTATE=1
# show $ if there are stashed changes
GIT_PS1_SHOWSTASHSTATE=1
# show % if there are untracked files
GIT_PS1_SHOWUNTRACKEDFILES=1
# show < if there are unpulled changes, > if there are unpushed changes, or <> if there are both
GIT_PS1_SHOWUPSTREAM=1

# REE settings to help tests run faster
# stolen from http://smartic.us/2010/10/27/tune-your-ruby-enterprise-edition-garbage-collection-settings-to-run-tests-faster/
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
