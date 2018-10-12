||feature||changes||status in DXP||
|templates/portal_normal.vm|* [removed {{Powered by Liferay}} text in footer|https://gitlab.mitre.org/org-mitre-facilitysafety/portal-theme/commit/0f0d5cbff26e270bfdda88cb725826f6af14e366]
* [added combined logo|https://gitlab.mitre.org/org-mitre-facilitysafety/portal-theme/commit/b5ff721820f55a3d6fe2072030ce798bd4737097]
* [banner should disappear when the {{tableau-viz-portlet}} is maximized|https://gitlab.mitre.org/org-mitre-facilitysafety/portal-theme/commit/e809a525d2236fb0c795d2fe704229368bfaacab]|* absent in DXP: !powered_by_liferay_footer_dxp.png|thumbnail!
* present in DXP; it was manually set in `prod` using the control panel, and was therefore persisted to the database (see [Official Liferay Administrator Guide|https://docs.liferay.com/portal/6.0/official/liferay-administrator-guide-6.0.pdf]): !combined_logo_dxp.png|thumbnail!
* present in DXP: !no_banner_tableau_viz_portlet_dxp.png|thumbnail!|
