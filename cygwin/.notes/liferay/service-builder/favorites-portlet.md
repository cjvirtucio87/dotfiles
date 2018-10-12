2018-08-23 18:59:16.154 INFO  [fileinstall-C:/cygwin64/opt/asias/liferay7-home/osgi/modules][UpgradeProcess:86] Upgrading org.mitre.caasd.navigation.favorites.internal.NavigationFavoritesServiceBundleActivator$1$1
2018-08-23 18:59:16.494 INFO  [fileinstall-C:/cygwin64/opt/asias/liferay7-home/osgi/modules][UpgradeProcess:103] Completed upgrade process org.mitre.caasd.navigation.favorites.internal.NavigationFavoritesServiceBundleActivator$1$1 in 340ms
2018-08-23 18:59:16.537 INFO  [fileinstall-C:/cygwin64/opt/asias/liferay7-home/osgi/modules][UpgradeProcess:86] Upgrading org.mitre.caasd.navigation.favorites.internal.upgrade.v100.UpgradeReleaseStep
INFO - Upgrading org.mitre.caasd.navigation.favorites.internal.upgrade.v100.UpgradeReleaseStep
2018-08-23 18:59:16.540 INFO  [fileinstall-C:/cygwin64/opt/asias/liferay7-home/osgi/modules][UpgradeProcess:103] Completed upgrade process org.mitre.caasd.navigation.favorites.internal.upgrade.v100.UpgradeReleaseStep in 3ms
INFO - Completed upgrade process org.mitre.caasd.navigation.favorites.internal.upgrade.v100.UpgradeReleaseStep in 3ms
2018-08-23 18:59:16.583 INFO  [fileinstall-C:/cygwin64/opt/asias/liferay7-home/osgi/modules][UpgradeProcess:86] Upgrading org.mitre.caasd.navigation.favorites.internal.upgrade.v100.UpgradeServiceComponentStep
INFO - Upgrading org.mitre.caasd.navigation.favorites.internal.upgrade.v100.UpgradeServiceComponentStep
2018-08-23 18:59:16.590 INFO  [fileinstall-C:/cygwin64/opt/asias/liferay7-home/osgi/modules][UpgradeProcess:103] Completed upgrade process org.mitre.caasd.navigation.favorites.internal.upgrade.v100.UpgradeServiceComponentStep in 7ms
INFO - Completed upgrade process org.mitre.caasd.navigation.favorites.internal.upgrade.v100.UpgradeServiceComponentStep in 7ms
2018-08-23 18:59:16.610 INFO  [fileinstall-C:/cygwin64/opt/asias/liferay7-home/osgi/modules][BundleStartStopLogger:35] STARTED org.mitre.caasd.navigation.favorites.service_4.0.0.SNAPSHOT [2315]


# bundle 0
com.liferay.portal.kernel.dao.orm; version="7.3.0"[exported]

# favorites-web
com.liferay.portal.kernel.dao.orm;resolution:=optional;
 version="[7.3,8)",


# from attempting dynamic query
org.hibernate.MappingException: Unknown entity: org.mitre.caasd.navigation.favorites.model.Favorite
