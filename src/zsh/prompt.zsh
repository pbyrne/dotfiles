setopt prompt_subst
# display git information
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true # support staged/unstaged changes output
zstyle ':vcs_info:git*:*' get-revision true # support getting additional revision information (like sha)
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '?'
# tell vcs_info how to populate %m (custom message)
zstyle ':vcs_info:git*+set-message:*' hooks git-stash git-incoming-outgoing git-new-files

# %b - branch name
# %m - custom misc message
# %u - unstaged changes
# %c - staged changes
# %a - current action (e.g., merge conflict, rebase)
zstyle ':vcs_info:git*' formats "%b %.7i %m%u%c"
zstyle ':vcs_info:git*' actionformats "%a %b %.7i %m%u%c"

+vi-git-stash() {
  local stash_count
  stash_count=$(git stash list 2> /dev/null | wc -l)

  [[ $stash_count -gt 0 ]] && hook_com[misc]+="∩"
  return 0
}

+vi-git-incoming-outgoing() {
  local ahead behind
  local -a gitstatus

  ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
  behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

  # -a means &&, essentially
  if [ $ahead -gt 0 -a $behind -gt 0 ]; then
    gitstatus='↕'
  elif [ $ahead -gt 0 ]; then
    gitstatus='↑'
  elif [ $behind -gt 0 ]; then
    gitstatus='↓'
  fi

  hook_com[misc]+=$gitstatus
  return 0
}

+vi-git-new-files() {
  new_files_count=$(git ls-files --others --exclude-standard 2> /dev/null | wc -l)

  [[ $new_files_count -gt 0 ]] && hook_com[misc]+="*"
  return 0
}

function pjb_redgreen_prompt() {
  # green ✓ for good commands, red ! for failed commands
  echo "%(?,%{%F{green}%}✓,%{%F{red}%}!)%{$reset_color%}"
}

function pjb_path() {
  # collapsed path (e.g., substituing ~ and environment variables in the PWD
  if [[ -n "$SSH_CONNECTION" ]];
  then
    echo "`hostname`@%~"
  else
    echo "%~"
  fi
}

function pjb_background_jobs() {
  # if at least one background job: %1(j
  # then display the number of jobs in brackets: [%j]
  # otherwise, display nothing: )
  # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
  echo "%1(j|[%j]|)"
}

function pjb_credentials() {
  [ -n "$AWS_SESSION_TOKEN" ] && echo -n "[MFA]"
}

# lifted from http://sebastiancelis.com/2009/11/16/zsh-prompt-git-users/
export PROMPT='
$(pjb_path) ${vcs_info_msg_0_} $(pjb_credentials) $(pjb_background_jobs)
$(pjb_redgreen_prompt) '
