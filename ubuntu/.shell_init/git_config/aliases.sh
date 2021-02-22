function gaa {
  # stage all files
  git add -A "$@"
}

function gcm {
  # commit all files with message as first argument
  local message="$1"
  shift
  git commit -m "${message}" "$@"
}

function gpoc {
  # push commits to origin
  git push origin "$@"
}

function gpocs {
  # push commits to origin and set upstream branch to first argument
  local branch_name="$1"
  shift
  git push origin --set-upstream "${branch_name}" "$@"
}

function gpom {
  # push commits to master
  git push origin master "$@"
}

function gw {
  # shortcut to worktree operations
  git worktree "$@"
}

function gwac {
  # add worktree at path ${HOME}/git/<current-directory-name>-<first-argument>,
  local version="$1"
  shift
  git worktree add "${HOME}/git/${PWD##*/}-${version}" --checkout "${version}" "$@"
}

function gwrc {
  # remove worktree at path ${HOME}/git/<current-directory-name>-<first-argument>
  local version="$1"
  shift
  git worktree remove "${HOME}/git/${PWD##*/}-${version}" "$@"
}
