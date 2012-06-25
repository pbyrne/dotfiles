# export PATH=~/Dropbox/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/:$DYLD_LIBRARY_PATH
export SHARED_WORKSPACE=~/workspace
# open in gui vim and wait for the window to close
export EDITOR='vim'
# in LION, needed this to compile ruby 1.8.7
export CC=/usr/bin/gcc-4.2
export NODE_PATH=/usr/local/lib/node_modules
export GREP_OPTIONS='--color=auto'

# REE settings to help tests run faster
# stolen from http://smartic.us/2010/10/27/tune-your-ruby-enterprise-edition-garbage-collection-settings-to-run-tests-faster/
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# what to split on
export WORDCHARS='*?[]~&;!$%^<>'

