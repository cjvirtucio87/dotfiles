#!/usr/bin/env bash

function main {
  local namespace="$1"

  argo --context minikube --namespace "${namespace}" "${@:2}"
}

main "$@"
