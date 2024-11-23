include $(TOPDIR)/rules.mk

PKG_NAME:=fantastic-keyring
PKG_VERSION:=20241123
PKG_RELEASE:=1

PKG_MAINTAINER:=Anya Lin <hukk1996@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=License

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=fantastic-packages Developer Keyring
  PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
  The keyring of with the developer using.
endef

Build/Compile=

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/apk/keys/
	$(INSTALL_DATA) $(CURDIR)/apksign/*.pem $(1)/etc/apk/keys/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
