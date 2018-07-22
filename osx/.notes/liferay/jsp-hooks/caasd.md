update_password
- removed all code in jsp because it's being disabled (we let cas take care of password resets) (https://gitlab.mitre.org/org-mitre-caasd/portal-jsp-hooks/commit/10534e5f81b0fc3962eef2c9efd0c3e18c3d7f6a)

user_admin/password
- disabled password reset input tag (https://gitlab.mitre.org/org-mitre-caasd/portal-jsp-hooks/commit/10534e5f81b0fc3962eef2c9efd0c3e18c3d7f6a)

users_admin/password
- disabled password reset input tag (https://gitlab.mitre.org/org-mitre-caasd/portal-jsp-hooks/commit/cac826f835f0ae9b6cef34a754a5b236baceada3)

dockbar/view_user_account
- added password change link (https://gitlab.mitre.org/org-mitre-caasd/portal-jsp-hooks/commit/82e7a3fe257f46867832bf27187474a252301ef2#091bd307ef5275e3fa5569bdfa23b6cfdaf77e4b)
# - changed the password change link's icon (https://gitlab.mitre.org/org-mitre-caasd/portal-jsp-hooks/commit/b257baec8d38c4ef117442abeac0a0246e5b4254)
# - namespaced css for the change to the link's icon (https://gitlab.mitre.org/org-mitre-caasd/portal-jsp-hooks/commit/93f8c80ccc5030077b416c079ac3ad35b916d9cb)
- removed username display (https://gitlab.mitre.org/org-mitre-caasd/portal-jsp-hooks/commit/6270d8d28c7ed64ae53667d58aeb44f79e789c36)

dockbar/view_my_sites
- completely replaced the built-in liferay implementation with our own "twisty" groupings (https://gitlab.mitre.org/org-mitre-caasd/portal-jsp-hooks/commit/7069b237f22a7ec2610ef2866bd8eddfd2ff9191)

we needed all changes available on all projects
- https://gitlab.mitre.org/org-mitre-caasd/portal-jsp-hooks/commit/04afd4c9e20e6e8d0b8ff5d3de673449b0701270
