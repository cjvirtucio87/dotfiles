#!/usr/bin/env bash

function main {
  local namespace="$1"

  oc --context docker-desktop --namespace "${namespace}" "${@:2}"
}

main "$@"
