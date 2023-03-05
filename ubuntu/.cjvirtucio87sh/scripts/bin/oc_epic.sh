#!/usr/bin/env bash

function main {
  local namespace="$1"

  oc --context epic --namespace "${namespace}" "${@:2}"
}

main "$@"
