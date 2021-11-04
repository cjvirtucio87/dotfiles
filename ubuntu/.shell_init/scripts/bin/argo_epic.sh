#!/usr/bin/env bash

function main {
  local namespace="$1"

  argo --context epic --namespace "${namespace}" "${@:2}"
}

main "$@"
