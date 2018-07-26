
# asset_publisher/display/title_list.jsp

### Initial URL

##### oversight

In `oversight-portal-jsp-hooks`, the implementation details of the factory method used in `asias-portal-jsp-hooks` leak to the client code (i.e. our code): 

```
PortletURL viewFullContentURL = renderResponse.createRenderURL();
```

##### asias

In `asias-portal-jsp-hooks`, we leverage a factory method to retrieve the URL. 

```
String viewURL = AssetPublisherHelperImpl.getAssetViewURL(liferayPortletRequest, liferayPortletResponse, assetEntry, viewInContext);
```

This is the implementation behind the API used: https://github.com/liferay/com-liferay-asset/blob/3866ae91a61cd3f94922aaaeabd652a1b1cf52bd/asset-publisher-impl/src/main/java/com/liferay/asset/publisher/internal/util/AssetPublisherHelperImpl.java#L499.


### Final URL

##### oversight

```
viewURL = themeDisplay.getPortalURL() + themeDisplay.getPathContext() + "/documents/" + assetEntry.getGroupId() + StringPool.SLASH + dlFileEntry.getFolderId() + StringPool.SLASH + HttpUtil.encodeURL(HtmlUtil.unescape(title));
```

##### asias

```
viewURL = themeDisplay.getPortalURL() + themeDisplay.getPathContext() + "/documents/" + assetEntry.getGroupId() + StringPool.SLASH + dlFileEntry.getFolderId() + StringPool.SLASH + HttpUtil.encodeURL(HtmlUtil.unescape(title));
```

The only other difference between the two projects is the hook for `file_entry_columns.jspf`, which doesn't exist anymore in DXP.



(jira)

The end result of the code for {{portlet/asset_publisher}} is pretty much the same for both projects.

In {{oversight-portal-jsp-hooks}}, we leverage a [factory method|https://github.com/liferay/com-liferay-asset/blob/master/asset-publisher-impl/src/main/java/com/liferay/asset/publisher/internal/util/AssetPublisherHelperImpl.java#L499] to retrieve the URL. In {{asias-portal-jsp-hooks}}, the implementation details of that method [leak to the client code|https://gitlab.mitre.org/org-mitre-asias/portal-jsp-hooks/blob/829415497bcfe17d089b81bcf567c1a16f8d4768/src/main/webapp/WEB-INF/hooks/html/portlet/asset_publisher/display/title_list.jsp#L38]. So we're doing the same thing for both {{oversight}} and {{asias}}, just that one is arguably a cleaner solution.

We've also made a couple of changes to [file_entry_columns.jspf|https://gitlab.mitre.org/org-mitre-oversight/portal-jsp-hooks/blob/52f5599bef732a81a6c8a3c2eaab3febf4bdd2e5/src/main/webapp/WEB-INF/hooks/html/portlet/document_library/file_entry_columns.jspf] in {{oversight}} that aren't in {{asias}}, but this is a moot issue since it doesn't exist anymore in DXP. In fact, the {{document_library}} has a completely different frontend now: !oversight_document_library.png|thumbnail!.

