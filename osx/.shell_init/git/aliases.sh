#!/usr/bin/env bash

function gaa {
  # Stage all files.
  #
  # Parameters:
  #   varargs: all arguments that git would accept
  git add -A "$@"
}

function gc {
  # Checkout to a branch.
  #
  # Parameters:
  #   branch: name of the branch to checkout to
  git checkout "$1"
}

function gcb {
  # Create and checkout to a new branch.
  #
  # Parameters:
  #   branch: name of the branch to checkout to
  git checkout -b "$1"
}

function gcm {
  # Commit all files with message as first argument.
  #
  # Parameters:
  #   message: the message for the commit
  #   varargs: all arguments that git would accept
  local message="$1"
  shift
  git commit -m "${message}" "$@"
}

function gpoc {
  # Push commits to origin.
  #
  # Parameters:
  #   varargs: all arguments that git would accept
  git push origin "$@"
}

function gpocs {
  # Push commits to origin and set upstream branch to name of current branch.
  #
  # Parameters:
  #   varargs: all arguments that git would accept
  local branch_name
  branch_name="$(git rev-parse --abbrev-ref HEAD)"
  git push origin --set-upstream "${branch_name}" "$@"
}

function gpom {
  # Push commits to master.
  #
  # Parameters:
  #   varargs: all arguments that git would accept
  git push origin master "$@"
}

function gralb {
  # Remove all local branches other than master.
  git branch | grep -v --extended-regexp '^(\s*master|\s*main|\*)' | xargs -I {} git branch -d {}
}

function gw {
  # Shortcut to worktree operations.
  #
  # Parameters:
  #   varargs: all arguments that git would accept
  git worktree "$@"
}

function gwac {
  # Add worktree at path ${HOME}/git/<current-directory-name>-<version>.
  #
  # If the version argument is not passed, current branch is used instead.
  #
  # Parameters:
  #   version: the git commit hash to checkout to (optional)
  #   varargs: all arguments that git would accept
  local version="$1"
  shift
  if [[ -z "${version}" ]]; then
    version="$(git rev-parse --abbrev-ref HEAD)"
  fi

  git worktree add "${HOME}/git/${PWD##*/}-${version}" --checkout "${version}" "$@"
}

function gwrc {
  # Remove worktree at path ${HOME}/git/<current-directory-name>-<version>.
  #
  # If the version argument is not passed, current branch is used instead.
  #
  # Parameters:
  #   version: the git commit hash to checkout to (optional)
  #   varargs: all arguments that git would accept
  local version="$1"
  shift
  if [[ -z "${version}" ]]; then
    version="$(git rev-parse --abbrev-ref HEAD)"
  fi

  git worktree remove "${HOME}/git/${PWD##*/}-${version}" "$@"
}
