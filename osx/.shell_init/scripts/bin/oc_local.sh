#!/usr/bin/env bash

function main {
  local namespace="$1"

  oc --context minikube --namespace "${namespace}" "${@:2}"
}

main "$@"
