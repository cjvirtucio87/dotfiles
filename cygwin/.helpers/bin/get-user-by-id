#!/usr/bin/bash

USER_ID=28702

echo "Basic $1";

if [ -z "$1" ]; then
    echo "ERROR: Must pass base64 encoded string for basic auth.";
    exit 1;
fi


curl -d "userId=$USER_ID" \
    -H "Authorization: Basic $1" \
    'http://localhost:20080/api/jsonws/user/get-user-by-id';
