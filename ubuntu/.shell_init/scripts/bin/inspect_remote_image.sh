#!/usr/bin/env bash

set -e

### Inspect an image on a remote registry
###
### Usage:
###   inspect_remote_image.sh rockylinux:rockylinux

function error_exit {
  local msg="$1"
  >&2 echo -e "${msg}"
  exit 1
}

function get_tag_component {
  local fq_tag="$1"
  local component_index="$2"
  cut -d '/' -f "${component_index}" < <(printf '%s' "${fq_tag}")
}

function get_image_meta {
  local registry="$1"
  local namespace="$2"
  local image_name="$3"
  local image_version="$4"

  local manifest_url="https://${registry}/v2/${namespace}/${image_name}/manifests/${image_version}"
  >&2 echo "manifest_url: ${manifest_url}"
  local manifest_json
  if ! manifest_json="$(curl --header 'Authorization: Bearer anonymous' --header 'Accept: application/vnd.docker.distribution.manifest.v2+json' "${manifest_url}")"; then
    error_exit "failed to retrieve manifest at URL ${manifest_url}"
  fi

  local digest
  if ! digest="$(jq --exit-status --raw-output '.config.digest' < <(printf '%s' "${manifest_json}"))"; then
    error_exit "failed to parse json ${manifest_json}"
  fi

  local meta_url="https://${registry}/v2/${namespace}/${image_name}/blobs/${digest}"
  local remote_config
  if ! remote_config="$(curl --header 'Authorization: Bearer anonymous' "${meta_url}")"; then
    error_exit "failed to retrieve meta at ${meta_url}"
  fi

  jq '.' < <(printf '%s' "${remote_config}")
}

function main {
  local -r fq_tag="$1"
  if [[ -z "${fq_tag}" ]]; then
    error_exit "fq_tag must NOT be empty"
  fi

  local image_name
  image_name="$(get_tag_component "${fq_tag}" 3 | cut -d ':' -f1)"

  local image_version
  image_version="$(get_tag_component "${fq_tag}" 3 | cut -d ':' -f2)"
  get_image_meta \
    "$(get_tag_component "${fq_tag}" 1)" \
    "$(get_tag_component "${fq_tag}" 2)" \
    "${image_name}" \
    "${image_version}"
}

main "$@"
