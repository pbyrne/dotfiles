# wg foo/bar to navigate to $GOPATH/src/github.com/foo/bar.
wg() {
  cd $GOPATH/src/github.com/$1
}

# the autocompletion function
_wg() {
  _files -W $GOPATH/src/github.com/
}

# and set up autocomplete for the function
compdef _wg wg
