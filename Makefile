# SPDX-License-Identifier: GPL-3
#
# Copyright (C) 2023-2025 muink <https://github.com/muink>

include $(TOPDIR)/rules.mk

PKG_NAME:=fantastic-packages
PKG_VERSION:=1.0
PKG_RELEASE:=20230428

PKG_MAINTAINER:=Anya Lin <hukk1996@gmail.com>
PKG_LICENSE:=GPL-3
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)/Default
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=self-use openwrt extended packages
	URL:=https://github.com/muink/fantastic-packages
	DEPENDS:=
	PKGARCH:=all
endef

define Package/$(PKG_NAME)-packages
	$(call Package/$(PKG_NAME)/Default)
	DEPENDS+:=\
		+alwaysonline \
		+bandix \
		+einat-ebpf \
		+fantastic-keyring \
		+fantastic-packages-feeds \
		+fakehttp \
		+fastfetch \
		+go-stun \
		+internet-detector \
		+mihomo \
		+natmapt \
		+natter \
		+pcap-dnsproxy \
		+rgmac \
		+scart \
		+shadowsocks-rust \
		+speedtest-go \
		+stuntman \
		+Toolkit \
		+uci-alwaysonline
endef

define Package/$(PKG_NAME)-luci
	$(call Package/$(PKG_NAME)/Default)
	DEPENDS+:=\
		+luci-app-alwaysonline \
		+luci-app-bandix \
		+luci-app-change-mac \
		+luci-app-cpu-perf \
		+luci-app-cpu-status \
		+luci-app-cpu-status-mini \
		+luci-app-diskman \
		+luci-app-disks-info \
		+luci-app-dnsproxy \
		+luci-app-einat \
		+luci-app-fakehttp \
		+luci-app-fchomo \
		+luci-app-interfaces-statistics \
		+luci-app-internet-detector \
		+luci-app-ipinfo \
		+luci-app-log-viewer \
		+luci-app-natmapt \
		+luci-app-natter \
		+luci-app-netspeedtest \
		+luci-app-packagesync \
		+luci-app-pcap-dnsproxy \
		+luci-app-qbittorrent \
		+luci-app-ssrust \
		+luci-app-temp-status \
		+luci-app-tinyfilemanager \
		+luci-app-tn-netports \
		+luci-app-xray \
		+luci-app-xray-status
endef

define Package/$(PKG_NAME)
	$(call Package/$(PKG_NAME)/Default)
	DEPENDS+:=\
		+alwaysonline \
		+bandix \
		+einat-ebpf \
		+fantastic-keyring \
		+fantastic-packages-feeds \
		+fakehttp \
		+fastfetch \
		+go-stun \
		+internet-detector \
		+mihomo \
		+natmapt \
		+natter \
		+pcap-dnsproxy \
		+rgmac \
		+scart \
		+shadowsocks-rust \
		+speedtest-go \
		+stuntman \
		+Toolkit \
		+uci-alwaysonline \
		+luci-app-alwaysonline \
		+luci-app-bandix \
		+luci-app-change-mac \
		+luci-app-cpu-perf \
		+luci-app-cpu-status \
		+luci-app-cpu-status-mini \
		+luci-app-diskman \
		+luci-app-disks-info \
		+luci-app-dnsproxy \
		+luci-app-einat \
		+luci-app-fchomo \
		+luci-app-interfaces-statistics \
		+luci-app-internet-detector \
		+luci-app-ipinfo \
		+luci-app-log-viewer \
		+luci-app-natmapt \
		+luci-app-natter \
		+luci-app-netspeedtest \
		+luci-app-packagesync \
		+luci-app-pcap-dnsproxy \
		+luci-app-qbittorrent \
		+luci-app-ssrust \
		+luci-app-temp-status \
		+luci-app-tinyfilemanager \
		+luci-app-tn-netports \
		+luci-app-xray \
		+luci-app-xray-status
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/conffiles
endef

define Package/$(PKG_NAME)/postinst
endef

define Package/$(PKG_NAME)/prerm
endef

define Package/$(PKG_NAME)/install/Default
	:
endef

Package/$(PKG_NAME)-packages/install = $(Package/$(PKG_NAME)/install/Default)
Package/$(PKG_NAME)-luci/install = $(Package/$(PKG_NAME)/install/Default)
Package/$(PKG_NAME)/install = $(Package/$(PKG_NAME)/install/Default)

$(eval $(call BuildPackage,$(PKG_NAME)-packages))
$(eval $(call BuildPackage,$(PKG_NAME)-luci))
$(eval $(call BuildPackage,$(PKG_NAME)))
