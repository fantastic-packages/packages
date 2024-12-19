# SPDX-License-Identifier: MIT
#
# Copyright (C) 2023-2024 muink <https://github.com/muink>

include $(TOPDIR)/rules.mk

PKG_NAME:=plain-nginx
PKG_VERSION:=20231028

PKG_MAINTAINER:=Anya lin <hukk1996@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Read text document directly
	DEPENDS:=+luci-nginx
	PKGARCH:=all
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/nginx/conf.d
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) ./files/text.locations $(1)/etc/nginx/conf.d/text.locations
	$(INSTALL_BIN) ./files/uci-defaults $(1)/etc/uci-defaults/60_$(PKG_NAME)
endef

define Package/$(PKG_NAME)/conffiles
/etc/nginx/conf.d/text.locations
endef


$(eval $(call BuildPackage,$(PKG_NAME)))
