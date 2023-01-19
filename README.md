### How to use

1. Add to `feeds.conf.default`
```shell
umask 022
sed -i '1i src-git fantastic-packages https://github.com/muink/fantastic-packages' feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig
```

2. Pull in the src/sdk directory
```shell
umask 022
git clone --recurse-submodules https://github.com/muink/fantastic-packages package/fantastic-packages
make menuconfig
```

### Package description
| Packages | Description |
| ---- | ---- |
| [luci-app-alwaysonline][] | Hijack/bypass Windows NCSI and iOS portal detection |
| [luci-app-change-mac][] | MAC address randomizer for LuCI |
| [luci-app-diskman][] | A Simple Disk Manager for LuCI |
| [luci-app-disks-info][] | Connected disk devices (partitions, filesystems, SMART) for LuCI |
| [luci-app-natter][] | TCP/UDP hole punching tool for LuCI |
| [luci-app-netdata][] | Netdata for LuCI |
| [luci-app-netspeedtest][] | Network Speed Test LuCI |
| [luci-app-pcap-dnsproxy][] | A DNS server for LuCI |
| [luci-app-serverchan][] | Service push |
| [luci-app-tinyfilemanager][] | Web based File Manager in PHP |
| [luci-app-tn-netports][] | Network ports status LuCI |
| [openwrt-alwaysonline][] | Hijack/bypass Windows NCSI and iOS portal detection |
| [openwrt-go-stun][] | A GO STUN client |
| [openwrt-Natter][] | TCP/UDP hole punching tool |
| [openwrt-Pcap_DNSProxy][] | Pcap_DNSProxy for OpenWrt/LEDE |
| [openwrt-rgmac][] | a simple random MAC address generator for OpenWRT |

--------

[luci-app-alwaysonline]: https://github.com/muink/luci-app-alwaysonline
[luci-app-change-mac]: https://github.com/muink/luci-app-change-mac
[luci-app-diskman]: https://github.com/lisaac/luci-app-diskman
[luci-app-disks-info]: https://github.com/gSpotx2f/luci-app-disks-info
[luci-app-natter]: https://github.com/muink/luci-app-natter
[luci-app-netdata]: https://github.com/muink/luci-app-netdata
[luci-app-netspeedtest]: https://github.com/muink/luci-app-netspeedtest
[luci-app-pcap-dnsproxy]: https://github.com/muink/luci-app-pcap-dnsproxy
[luci-app-serverchan]: https://github.com/tty228/luci-app-serverchan
[luci-app-tinyfilemanager]: https://github.com/muink/luci-app-tinyfilemanager
[luci-app-tn-netports]: https://github.com/muink/luci-app-tn-netports
[openwrt-alwaysonline]: https://github.com/muink/openwrt-alwaysonline
[openwrt-go-stun]: https://github.com/muink/openwrt-go-stun
[openwrt-Natter]: https://github.com/muink/openwrt-Natter
[openwrt-Pcap_DNSProxy]: https://github.com/muink/openwrt-Pcap_DNSProxy
[openwrt-rgmac]: https://github.com/muink/openwrt-rgmac
