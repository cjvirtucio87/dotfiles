#!/usr/bin/bash

# validate argument

echo "Basic $1";

if [ -z "$1" ]; then
    echo "ERROR: Must pass base64 encoded string for basic auth.";
    exit 1;
fi

# verify that the roles have been eliminated (output should be '0 results')
fpl ldap asias.localhost.ldap search --scope sub --filter '(uniqueMember=uid=seleniumadmin*)' --attr 'cn';

# copy the user object from dev_lr7 to localhost_lr7
fpl ldap asias.dev_lr7.ldap copy-user-to asias.localhost.ldap --email seleniumadmin@asias.aero;

# remove a user from a user group, then put the user back
curl -d "userIds=%5B28702%5D&userGroupId=13323" \
    -H "Authorization: Basic $1" \
    -X POST 'http://localhost:20080/api/jsonws/user/unset-user-group-users';

curl -d "userIds=%5B28702%5D&userGroupId=13323" \
    -H "Authorization: Basic $1" \
    -X POST 'http://localhost:20080/api/jsonws/user/set-user-group-users';

# verify that the roles have been restored
fpl ldap asias.localhost.ldap search --scope sub --filter '(uniqueMember=uid=seleniumadmin*)' --attr 'cn';
