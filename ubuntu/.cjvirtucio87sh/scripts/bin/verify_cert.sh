#!/usr/bin/env bash

set -e

### Verify that the argument certificate is present in
### the CAFILE.
###
### Usage:
###   <Options> verify_cert.sh <Arguments>
###
### Arguments:
###   cacert: the cert to verify
###
### Options:
###   CAFILE: the CA bundle to be inspected for the presence of the
###     argument cacert (default: /etc/ssl/certs/ca-certificates.crt)

readonly CAFILE="${CAFILE:-/etc/ssl/certs/ca-certificates.crt}"

function main {
  openssl verify -CAfile "${CAFILE}" "$1"
}

main "$@"
