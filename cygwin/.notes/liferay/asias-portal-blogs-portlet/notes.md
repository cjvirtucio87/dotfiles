||feature||changes||status in DXP||
|listeners/BlogsEntryListener.java|* [when a blog is created/deleted, all MITRE Contacts are immediately subscribed/unsubscribed to the creation of new comments on that blog|https://gitlab.mitre.org/org-mitre-asias/portal-blogs-portlet/blob/master/src/main/java/org/mitre/asias/portlet/blogs/listeners/BlogsEntryListener.java#L46]|absent in DXP: !blog_comments_unsubscribed_dxp.png|thumbnail!|
|listeners/UserGroupRoleListener.java|* [when a user is assigned the MITRE Contact role, that user is then subscribed to the creation of new blogs, and the creation of new comments on existing blogs|https://gitlab.mitre.org/org-mitre-asias/portal-blogs-portlet/blob/5cdc4e304d00a15b9f155abc75fa608753035dd1/src/main/java/org/mitre/asias/portlet/blogs/listeners/UserGroupRoleListener.java#L35]|absent in DXP: !blogs_unsubscribed_dxp.png|thumbnail!|
|content/Language.properties, and various {{jsp}}/{{jspf}} files|* [changed _Add Blog Entry_ to _Add New Post_|https://gitlab.mitre.org/search?utf8=%E2%9C%93&snippets=&scope=&search=asias-add-blog-entry&project_id=6159]
* [changed _Subscribe_ to _Subscribe to Posts_|https://gitlab.mitre.org/search?utf8=%E2%9C%93&snippets=&scope=&search=asias-subscribe&project_id=6159]
* [changed _Unsubscribe_ to _Unsubscribe from Posts_|https://gitlab.mitre.org/search?utf8=%E2%9C%93&snippets=&scope=&search=asias-unsubscribe&project_id=6159]
* [hid blog permissions from non-admin users when creating/editing a blog|https://gitlab.mitre.org/org-mitre-asias/portal-blogs-portlet/commit/5cdc4e304d00a15b9f155abc75fa608753035dd1]
* [hid blog permissions from non-admin users in the options when clicking on the ellipsis for a blog entry|https://gitlab.mitre.org/org-mitre-asias/portal-blogs-portlet/commit/9d03f586723a9142880d0f853b42f083f2d7551b]
* [hid global category in categories section|https://gitlab.mitre.org/org-mitre-asias/portal-blogs-portlet/commit/12fc79c48df62191a0e8a1e016385a69f8b8c5a6]
* [changed {{Blog Entry}} in the {{Related Assets}} section to {{Posts}}|https://gitlab.mitre.org/org-mitre-asias/portal-blogs-portlet/commit/aff70043eaa4f05e36a36d609e9814d442f081dd]
* [changed label for blog entry's search result facet from {{Blog Entry}} to {{Post}}|https://gitlab.mitre.org/org-mitre-asias/portal-blogs-portlet/commit/2e8deb5154539fcaf24144b80784ea69f25a0f66]
* [ensured that assigned category remains after saving a blog|https://gitlab.mitre.org/org-mitre-asias/portal-blogs-portlet/commit/530174738b3a5e555683d8becd32ec4d213125f9]|* absent in DXP: !blogs_add_entry_dxp.png|thumbnail!
* absent in DXP: !blogs_subscribed_dxp.png|thumbnail!
* absent in DXP: !blogs_unsubscribed_dxp.png|thumbnail!
* absent in DXP: !blog_add_entry_permissions_dxp.png|thumbnail!
* absent in DXP: !blog_options_permissions_dxp.png|thumbnail!
* absent in DXP: !blogs_categorization_noglobal_dxp.png|thumbnail!
* absent in DXP: !blog_related_assets_blogs_entry_dxp.png|thumbnail!
* absent in DXP: !blog_entry_search_facet_dxp.png|thumbnail!
* built into DXP: !blog_category_after_successful_save.png|thumbnail!|
|portal-enhancements|* [disabled pingbacks and tracebacks option in editting a blog entry|https://gitlab.mitre.org/org-mitre-asias/portal-enhancements/blob/master/portal-enhancements-ext-impl/src/main/resources/portal-ext.properties#L132]
* [created and loaded templates for blog entry email notifications|https://gitlab.mitre.org/org-mitre-asias/portal-enhancements/commit/d28e0cf41653eda31f12239a61d5a86702b44dab]|* absent in DXP: !blog_allow_pingbacks_dxp.png|thumbnail!
* absent in DXP: !blog_entry_added_notification_dxp.png|thumbnail!|
|blogs/css/main.css|* [increased the default size of the abstract's description|https://gitlab.mitre.org/org-mitre-asias/portal-blogs-portlet/commit/aff70043eaa4f05e36a36d609e9814d442f081dd]|* absent in DXP (no abstract section): !blog_new_blog_dxp.png|thumbnail!|
