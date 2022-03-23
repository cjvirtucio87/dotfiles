#!/usr/bin/env bash

set -e

### Change the folder of an item in your bitwarden vault.
###
### Usage:
###   change_folder.sh <Arguments>
###
### Arguments:
###   item_name: the name of the item whose folder will be changed
###   folder_name: the name of the folder that the item will be moved to
###
### Examples:
###   # Change the folder for item named 'work_account' to 'Company X'
###   change_folder.sh work_account 'Company X'
###
### Remarks:
###   This command is a pass-through to bitwarden CLI and uses jq
###   to manipulate the items.

function log {
  >&2 printf '[%s] %s\n' "$(date --iso=s)" "$1"
}

function main {
  local item_name="$1"
  local folder_name="$2"

  local folder_json
  if ! folder_json="$(bw get folder "${folder_name}")"; then
    log "${folder_json}"
    log "failed to retrieve folder"
    return 1
  fi

  local item_json
  if ! item_json="$(bw get item "${item_name}")"; then
    log "${item_json}"
    log "failed to retrieve item"
    return 1
  fi

  local folder_id
  folder_id="$(jq -r '.id' <<<"${folder_json}")"

  local item_id
  item_id="$(jq -r '.id' <<<"${item_json}")"
  jq ".folderId=\"${folder_id}\"" <<<"${item_json}" \
    | base64 -w 0 \
    | bw edit item "${item_id}"
}

main "$@"
