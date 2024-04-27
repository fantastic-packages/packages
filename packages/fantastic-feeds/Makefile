include $(TOPDIR)/rules.mk

PKG_NAME:=fantastic-feeds
PKG_VERSION:=20240427
PKG_RELEASE:=1

PKG_MAINTAINER:=Anya Lin <hukk1996@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=License

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=base
  CATEGORY:=Base system
  DEPENDS:=+fantastic-keyring +opkg
  TITLE:=Installer for fantastic-packages feeds
  PKGARCH:=all
endef

Build/Compile=

define Package/$(PKG_NAME)/install
	:
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
if [ -n "$$IPKG_INSTROOT" ]; then
	# building
	eval "$$(grep CONFIG_VERSION_NUMBER $$TOPDIR/.config)"
	eval "$$(grep CONFIG_VERSION_REPO $$TOPDIR/.config)"
	REVISION=$$($$TOPDIR/scripts/getver.sh)
	if [ -n "$$CONFIG_VERSION_REPO" ]; then
		VERSION_NUMBER=$${CONFIG_VERSION_REPO##*/}
	else
		VERSION_NUMBER=$${CONFIG_VERSION_NUMBER:-SNAPSHOT}
		REVISION=$${REVISION:1:5}
	fi
	if [ "$VERSION_NUMBER" = "SNAPSHOT" ]; then
		BRANCH="23.05"
		[ "$$REVISION" -lt 23069 ] && BRANCH="22.03"
		[ "$$REVISION" -lt 19302 ] && BRANCH="21.02"
		# https://archive.openwrt.org/releases/
		# r23069-e2701e0f33    23.05.0-rc1
		# r19302-df622768da    22.03.0-rc1
		# r16122-c2139eef27    21.02.0-rc2
	else
		BRANCH=$$(echo $$VERSION_NUMBER | awk -F '.' -v OFS='.' '{print $$1,$$2}')
	fi
else
	# system
	eval "$$(grep DISTRIB_RELEASE /etc/openwrt_release)"
	eval "$$(grep DISTRIB_REVISION /etc/openwrt_release)"
	eval "$$(grep DISTRIB_ARCH /etc/openwrt_release)"
	if [ "$$DISTRIB_RELEASE" = "SNAPSHOT" ]; then
		REVISION=$${DISTRIB_REVISION:1:5}
		BRANCH="23.05"
		[ "$$REVISION" -lt 23069 ] && BRANCH="22.03"
		[ "$$REVISION" -lt 19302 ] && BRANCH="21.02"
	else
		BRANCH=$$(echo $$DISTRIB_RELEASE | awk -F '.' -v OFS='.' '{print $$1,$$2}')
	fi
fi
if ! grep -q fantastic_packages_ "$$IPKG_INSTROOT/etc/opkg/customfeeds.conf"; then
	BASE_URL="https://fantastic-packages.github.io/packages/releases"
	BASE_URL="$$BASE_URL/$$BRANCH/packages/$$DISTRIB_ARCH"
	echo "src/gz fantastic_packages_luci     $$BASE_URL/luci"     >> "$$IPKG_INSTROOT/etc/opkg/customfeeds.conf"
	echo "src/gz fantastic_packages_packages $$BASE_URL/packages" >> "$$IPKG_INSTROOT/etc/opkg/customfeeds.conf"
fi
exit 0
endef

define Package/$(PKG_NAME)/prerm
#!/bin/sh
[ -n "$$IPKG_INSTROOT" ] && exit 0
sed -i "/fantastic_packages_/d" "$$IPKG_INSTROOT/etc/opkg/customfeeds.conf"
exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
