export SHARED_WORKSPACE=~/workspace
# open in gui vim and wait for the window to close
export EDITOR='vim'
export GREP_OPTIONS='--color=auto'

# what to split on
export WORDCHARS='*?[]~&;!$%^<>'

# Tell shell where GO bins are installed
export GOPATH=$HOME/workspace/go
mkdir -p $GOPATH
export PATH=$GOPATH/bin:$PATH

# Used by database.yml
export DBUSER=postgres

# Brew-installed openssl
export OPENSSL_INCLUDE_DIR="/usr/local/opt/openssl/include"
export OPENSSL_LIB_DIR="/usr/local/opt/openssl/lib"
