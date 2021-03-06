zstyle ':completion:*' use-cache on

__git_files () {
  _wanted files expl 'local files' _files
}

__swap-credentials() {
  local actions=("${(f)$(swap-credentials help | grep '  \w' | cut -d' ' -f3)}")

  _arguments "1: :($actions)"
}

compdef __swap-credentials swap-credentials

## case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi
