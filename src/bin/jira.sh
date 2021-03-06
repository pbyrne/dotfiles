#!/bin/bash

set -e

issue_jq=$(cat <<EOJQ
{
  id: .key,
  assignee: .fields.assignee.displayName,
  priority: .fields.priority.name,
  status: .fields.status.name,
  title: .fields.summary,
  type: .fields.issuetype.name,
  url: "https://$JIRA_API_HOSTNAME/browse/\(.key)",
}
EOJQ
)

main() {
  local cmd="$1"
  local arg="$2"

  case "$cmd" in
    list) list_issues $arg;;
    issue) display_issue $arg;;
    *) usage;;
  esac
}

function display_issue() {
  local key="$1"

  [ -z "$key" ] && exit_failure_code "Missing ticket ID. Try '$(basename $0) help'."

  _jira_curl "issue/$key" "$issue_jq"
}

function exit_failure_code() {
  echo "$*" >&2
  exit 1
}

function usage() {
  echo "$(basename $0) (issue ID | list | help)"
  echo
  echo "  issue ID   - display information about issue ID (ex: HE-404)"
  echo "  list       - list issues assigned to you in active sprints"
  echo "  help       - display this help"
}

function list_issues() {
  fail_if_missing_jq
  local flag="$1"

  query="assignee in (currentUser()) AND sprint in openSprints() ORDER BY project ASC, key ASC"
  search="jql=$(echo $query | jq -sRr @uri)"

  _jira_curl "search?$search" "[.issues | .[] | $issue_jq]"
}

function _jira_curl() {
  [ -z "$JIRA_API_TOKEN" ] && exit_failure_code JIRA_API_TOKEN environment variable missing. Please add it. For details of generating an API token, see https://confluence.atlassian.com/cloud/api-tokens-938839638.html.
  [ -z "$JIRA_API_USERNAME" ] && exit_failure_code "JIRA_API_USERNAME environment variable missing. Please add it (ex: example@example.com)."
  [ -z "$JIRA_API_HOSTNAME" ] && exit_failure_code "JIRA_API_HOSTNAME environment variable missing. Please add it (ex: example.atlassian.net)."
  fail_if_missing_jq

  local path=$1
  local filter=$2
  local url="https://$JIRA_API_HOSTNAME/rest/api/latest/$path"

  # echo curl --silent -u '$JIRA_API_USERNAME:$JIRA_API_TOKEN' -X GET -H '"Content-Type: application/json"' "$url"
  curl --silent -u $JIRA_API_USERNAME:$JIRA_API_TOKEN -X GET -H "Content-Type: application/json" "$url" | jq "$filter"
}

function fail_if_missing_jq() {
  command -v jq >/dev/null 2>&1 || exit_failure_code "This leverages the 'jq' command-line tool for parsing JSON. Install it."
}

main $*
