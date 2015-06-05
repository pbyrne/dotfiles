# from homebrew's zsh-completions
fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions $fpath)
# And rebuild completions
compinit

zstyle ':completion:*' use-cache on

__git_files () {
  _wanted files expl 'local files' _files
}

## case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

