#!/usr/bin/bash

# validate argument

echo "Basic $1";

if [ -z "$1" ]; then
    echo "ERROR: Must pass base64 encoded string for basic auth.";
    exit 1;
fi

curl -d "locale=en&birthdayYear=1980&screenName=testuser691023&firstName=Test&jobTitle=&password2=&autoScreenName=false&suffixId=0&groupIds=%5B%5D&roleIds=%5B%5D&facebookId=0&userGroupIds=%5B%5D&password1=&autoPassword=true&male=false&companyId=10132&birthdayMonth=1&birthdayDay=1&sendEmail=false&openId=testuser691023_OpenId&middleName=&lastName=User&prefixId=0&emailAddress=testuser691023%40email.com&userId=0&groupId=0&organizationIds=%5B%5D" \
    -H "Authorization: Basic $1" \
    -X POST https://asias-portal-dev-lr7.mitre.org/api/jsonws/user/add-user
