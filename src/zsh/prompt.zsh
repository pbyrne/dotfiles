setopt prompt_subst
# display git information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true # support staged/unstaged changes output
precmd() {
    vcs_info
}
# %b - branch name
# %m - stash details
# %u - unstaged changes
# %c - staged changes
zstyle ':vcs_info:git*' formats "| %b %m%u%c"


function pjb_redgreen_prompt() {
  # green ✓ for good commands, red ! for failed commands
  echo "%(?,%{%F{green}%}✓,%{%F{red}%}!)%{$reset_color%}"
}

function pjb_path() {
  # collapsed path (e.g., substituing ~ and environment variables in the PWD
  echo "%~"
}

function pjb_tools() {
  # interpreter and short version (e.g., ruby-1.9.3 or ree-1.8.7)
  echo `rbenv version-name 2> /dev/null`
}

function pjb_background_jobs() {
  # if at least one background job: %1(j
  # then display the number of jobs in brackets: [%j]
  # otherwise, display nothing: )
  # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
  echo "%1(j|[%j]|)"
}

# lifted from http://sebastiancelis.com/2009/11/16/zsh-prompt-git-users/
export PROMPT='
$(pjb_path) $(pjb_background_jobs) $(pjb_tools) ${vcs_info_msg_0_}
$(pjb_redgreen_prompt) '
