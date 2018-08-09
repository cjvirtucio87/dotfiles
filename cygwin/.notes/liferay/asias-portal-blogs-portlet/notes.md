||feature||changes||status in DXP||
|listeners/BlogsEntryListener.java|* [when a blog is created/deleted, all MITRE Contacts are immediately subscribed/unsubscribed to the creation of new comments on that blog|https://gitlab.mitre.org/org-mitre-asias/portal-blogs-portlet/blob/master/src/main/java/org/mitre/asias/portlet/blogs/listeners/BlogsEntryListener.java#L46]|absent in DXP: !blog_comments_unsubscribed_dxp.png|thumbnail!|
|listeners/UserGroupRoleListener.java|* [when a user is assigned the MITRE Contact role, that user is then subscribed to the creation of new blogs, and the creation of new comments on existing blogs|https://gitlab.mitre.org/org-mitre-asias/portal-blogs-portlet/blob/5cdc4e304d00a15b9f155abc75fa608753035dd1/src/main/java/org/mitre/asias/portlet/blogs/listeners/UserGroupRoleListener.java#L35]|absent in DXP: !blogs_unsubscribed_dxp.png|thumbnail!|
|content/Language.properties, and various {{jsp}}/{{jspf}} files|* [changed _Add Blog Entry_ to _Add New Post_|https://gitlab.mitre.org/search?utf8=%E2%9C%93&snippets=&scope=&search=asias-add-blog-entry&project_id=6159]
* [changed _Subscribe_ to _Subscribe to Posts_|https://gitlab.mitre.org/search?utf8=%E2%9C%93&snippets=&scope=&search=asias-subscribe&project_id=6159]
* [changed _Unsubscribe_ to _Unsubscribe from Posts_|https://gitlab.mitre.org/search?utf8=%E2%9C%93&snippets=&scope=&search=asias-unsubscribe&project_id=6159]
* [hid blog entry edit permissions from non-admin users|https://gitlab.mitre.org/org-mitre-asias/portal-blogs-portlet/commit/9d03f586723a9142880d0f853b42f083f2d7551b]|* absent in DXP: !blogs_add_entry_dxp.png|thumbnail!
* absent in DXP: !blogs_unsubscribed_dxp.png|thumbnail!
* absent in DXP: !blogs_subscribed_dxp.png|thumbnail!
* absent in DXP: !permissions_blog_entry_options_dxp.png|thumbnail!|
|portal-enhancements|* [disabled pingbacks and tracebacks option in editting a blog entry|https://gitlab.mitre.org/org-mitre-asias/portal-enhancements/blob/master/portal-enhancements-ext-impl/src/main/resources/portal-ext.properties#L132]|* absent in DXP: !blog_allow_pingbacks_dxp.png|thumbnail!|
