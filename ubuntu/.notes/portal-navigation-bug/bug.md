The account button is normally used to open and close the product menu. However, when we navigate to another page, the account button stops working. We suspect it has to do with something locking up the server, as evidenced by the "Oops, this is taking longer than expected." warning in the lower-left corner.

To reproduce:

1. Go to the home page.

2. Navigate to the home page by clicking on the "Liferay" button on the top-left corner.

3. Click on the account button.

4. The account button won't close the sidebar.

5. After a few seconds, a warning stating "Oops, this is taking longer than expected." will appear on the lower-left corner.



Isaac,

We've investigated the issue further and were able to reproduce it with the following steps. Please note that these were executed across three browsers (Edge, Chrome, Firefox).

1. Download liferay-dxp-digital-enterprise-7.0.10.10-sp10.
2. Download and install liferay-fix-pack-de-75-7010 with the patching-tool.
3. Start the liferay instance.
4. Accept defaults.
5. Set password when prompted.
6. Click the user icon once. If the sidebar is already open, this will put the user menu in focus. Otherwise, this will open the sidebar.
7. Cose the menu using the top-left "sliding" button.
8. Click on the user icon again; the sidebar should fail to open.
9. Refresh the page with a bypass of web content cache (in Firefox, this is done by clicking on the refresh button while holding shift).
10. Repeatedly click on the user icon; the sidebar should open and close as expected.

