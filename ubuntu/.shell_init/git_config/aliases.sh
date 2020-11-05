function gaa {
  # stage all files
  git add -A "$@"
}

function gcm {
  # commit all files with message as first argument
  git commit -m "$1"
}

function gpoc {
  # push commits to origin
  git push origin "$@"
}

function gpocs {
  # push commits to origin and set upstream branch to first argument
  git push origin --set-upstream "$1"
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
  git worktree add "${HOME}/git/${PWD##*/}-$1" --checkout "$1"
}

function gwrc {
  # remove worktree at path ${HOME}/git/<current-directory-name>-<first-argument>
  git worktree remove "${HOME}/git/${PWD##*/}-$1"
}
