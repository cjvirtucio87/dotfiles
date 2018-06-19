# automation account
FILTER='(uniqueMember=uid=seleniumadmin*)' 
EMAIL='seleniumadmin@asias.aero'
USERID='28702'

# verify that the roles have been eliminated (output should be '0 results')
fpl ldap asias.dev_lr7.ldap search --scope 'sub' --filter $FILTER --attr 'cn';

# copy the user object from prod to dev_lr7
fpl ldap asias.prod.ldap copy-user-to asias.dev_lr7.ldap --email $EMAIL;

# force an LDAP sync by manipulating the group membership of the automation account
fpl liferay asias.dev_lr7 api-service user unset-user-group-users --param userGroupId=13323 --param userIds=$USERID;
fpl liferay asias.dev_lr7 api-service user set-user-group-users --param userGroupId=13323 --param userIds=$USERID;

# verify that the roles have been restored
fpl ldap asias.dev_lr7.ldap search --scope 'sub' --filter $FILTER --attr 'cn';






#my account
FILTER='(uniqueMember=uid=christop*)' 
EMAIL='cvirtucio@mitre.org'
USERID='1061035'

# verify that the roles have been eliminated (output should be '0 results')
fpl ldap asias.dev_lr7.ldap search --scope 'sub' --filter $FILTER --attr 'cn';

# copy the user object from prod to dev_lr7
fpl ldap asias.prod.ldap copy-user-to asias.dev_lr7.ldap --email $EMAIL;

# force an LDAP sync by manipulating the group membership of the automation account
fpl liferay asias.dev_lr7 api-service user unset-user-group-users --param userGroupId=13323 --param userIds=$USERID;
fpl liferay asias.dev_lr7 api-service user set-user-group-users --param userGroupId=13323 --param userIds=$USERID;

# verify that the roles have been restored
fpl ldap asias.dev_lr7.ldap search --scope 'sub' --filter $FILTER --attr 'cn';
