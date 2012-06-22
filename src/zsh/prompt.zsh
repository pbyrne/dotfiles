setopt prompt_subst

function pjb_redgreen_prompt() {
  # green $ for good commands, red $ for failed commands
  echo "%(?,%{%F{green}%},%{%F{red}%})$%{$reset_color%}"
}

function pjb_path() {
  # collapsed path (e.g., substituing ~ and environment variables in the PWD
  echo "%~"
}

function pjb_tools() {
  # interpreter and short version (e.g., ruby-1.9.3 or ree-1.8.7)
  echo `rvm-prompt i v 2> /dev/null`
}

function pjb_gitinfo() {
  # nothing just quite yet
}

export PROMPT='
$(pjb_path) $(pjb_tools) $(pjb_gitinfo)
$(pjb_redgreen_prompt) '
