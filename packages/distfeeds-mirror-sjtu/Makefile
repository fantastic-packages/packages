# SPDX-License-Identifier: MIT
#
# Copyright (C) 2026 fantastic-packages

include $(TOPDIR)/rules.mk

PKG_NAME:=distfeeds-mirror-sjtu
PKG_VERSION:=20260206
PKG_RELEASE:=1

PKG_MAINTAINER:=Anya Lin <hukk1996@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=License

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=base
  CATEGORY:=Base system
  DEPENDS:=
  TITLE:=Use Shanghai Jiao Tong University mirror as distfeeds
  PKGARCH:=all
endef

Build/Compile=

define Package/$(PKG_NAME)/install
	:
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
if   [ -x "/usr/bin/apk" ]; then
	sed -i "s|https*://downloads.openwrt.org|https://mirror.sjtu.edu.cn/openwrt|" "$$IPKG_INSTROOT/etc/apk/repositories.d/customfeeds.list"
elif [ -x "/bin/opkg" ]; then
	sed -i "s|https*://downloads.openwrt.org|https://mirror.sjtu.edu.cn/openwrt|" "$$IPKG_INSTROOT/etc/opkg/customfeeds.conf"
fi
exit 0
endef

define Package/$(PKG_NAME)/prerm
#!/bin/sh
if   [ -x "/usr/bin/apk" ]; then
	sed -i "s|https*://mirror.sjtu.edu.cn/openwrt|https://downloads.openwrt.org|" "/etc/apk/repositories.d/customfeeds.list"
elif [ -x "/bin/opkg" ]; then
	sed -i "s|https*://mirror.sjtu.edu.cn/openwrt|https://downloads.openwrt.org|" "/etc/opkg/customfeeds.conf"
fi
exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
