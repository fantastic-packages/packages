### How to use

1. Add to `feeds.conf.default`
```shell
umask 022
sed -i '1i src-git fantastic https://github.com/muink/fantastic-packages' feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig
```

2. Pull in the src/sdk directory
```shell
umask 022
git clone https://github.com/muink/fantastic-packages package/fantastic-packages
make menuconfig
```

### Package description
| Packages | Description |
| ---- | ---- |
| [luci-app-tinyfilemanager][] | Web based File Manager in PHP |
| [luci-app-diskman][] | A Simple Disk Manager for LuCI |
| [luci-app-disks-info][] | Connected disk devices (partitions, filesystems, SMART) for LuCI |
| [luci-app-change-mac][] | MAC address randomizer for LuCI |
| [luci-app-natter][] | TCP/UDP hole punching tool for LuCI |
| [luci-app-pcap-dnsproxy][] | A DNS server for LuCI |
| [luci-app-tn-netports][] | Network ports status LuCI |
| [luci-app-serverchan][] | Service push |
| [luci-app-netspeedtest][] | Network Speed Test LuCI |
| [luci-app-netdata][] | Netdata for LuCI |
| [openwrt-go-stun][] | A GO STUN client  |
| [openwrt-alwaysonline][] | Hijack/bypass Windows NCSI and iOS portal detection |

--------

[luci-app-tinyfilemanager]: https://github.com/muink/luci-app-tinyfilemanager
[luci-app-diskman]: https://github.com/lisaac/luci-app-diskman
[luci-app-disks-info]: https://github.com/gSpotx2f/luci-app-disks-info
[luci-app-change-mac]: https://github.com/muink/luci-app-change-mac
[luci-app-natter]: https://github.com/muink/luci-app-natter
[luci-app-pcap-dnsproxy]: https://github.com/muink/luci-app-pcap-dnsproxy
[luci-app-tn-netports]: https://github.com/muink/luci-app-tn-netports
[luci-app-serverchan]: https://github.com/tty228/luci-app-serverchan
[luci-app-netspeedtest]: https://github.com/muink/luci-app-netspeedtest
[luci-app-netdata]: https://github.com/muink/luci-app-netdata
[openwrt-go-stun]: https://github.com/muink/openwrt-go-stun
[openwrt-alwaysonline]: https://github.com/muink/openwrt-alwaysonline
