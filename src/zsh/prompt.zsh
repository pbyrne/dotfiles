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

# lifted from http://sebastiancelis.com/2009/11/16/zsh-prompt-git-users/
unset __CURRENT_GIT_BRANCH
unset __CURRENT_GIT_BRANCH_STATUS
unset __CURRENT_GIT_BRANCH_IS_DIRTY
function pjb_gitinfo() {
  local st="$(git status 2>/dev/null)"
  if [[ -n "$st" ]]; then
      local -a arr
      arr=(${(f)st})

      if [[ $arr[1] =~ 'Not currently on any branch.' ]]; then
          __CURRENT_GIT_BRANCH='no-branch'
      else
          __CURRENT_GIT_BRANCH="${arr[1][(w)4]}";
      fi

      if [[ $arr[2] =~ 'Your branch is' ]]; then
          if [[ $arr[2] =~ 'ahead' ]]; then
              __CURRENT_GIT_BRANCH_STATUS='ahead'
          elif [[ $arr[2] =~ 'diverged' ]]; then
              __CURRENT_GIT_BRANCH_STATUS='diverged'
          else
              __CURRENT_GIT_BRANCH_STATUS='behind'
          fi
      fi

      if [[ ! $st =~ 'nothing to commit' ]]; then
          __CURRENT_GIT_BRANCH_IS_DIRTY='1'
      fi
  fi

  if [ -n "$__CURRENT_GIT_BRANCH" ]; then
      local s="("
      s+="$__CURRENT_GIT_BRANCH"
      case "$__CURRENT_GIT_BRANCH_STATUS" in
          ahead)
          s+=" ↑"
          ;;
          diverged)
          s+=" ↕"
          ;;
          behind)
          s+=" ↓"
          ;;
      esac
      if [ -n "$__CURRENT_GIT_BRANCH_IS_DIRTY" ]; then
          s+=" ⚡"
      fi
      s+=")"

      printf " %s%s" "%{${fg[yellow]}%}" $s
  fi
}

export PROMPT='
$(pjb_path) $(pjb_tools) $(pjb_gitinfo)
$(pjb_redgreen_prompt) '
