# fantastic-packages Packages Downloads
Welcome to the fantastic-packages packages download page. Follow the links below to find the appropriate directory.

## Link
[Releases](https://fantastic-packages.github.io/packages/releases/)

## How to use on OpenWRT
### Edit `/etc/opkg/customfeeds.conf`
- Append the following to the EOF
```ini
src/gz fantastic_packages_luci https://fantastic-packages.github.io/packages/releases/<major.minor version>/packages/<package arch>/luci
src/gz fantastic_packages_packages https://fantastic-packages.github.io/packages/releases/<major.minor version>/packages/<package arch>/packages
src/gz fantastic_packages_special https://fantastic-packages.github.io/packages/releases/<major.minor version>/packages/<package arch>/special
```

**Note: Please refer to this [matrix](https://github.com/fantastic-packages/packages/blob/master/.github/workflows/AutoBuild.yml#L61) for currently supported Version and Architecture.
If your device is not listed, you can fork this repo and modify the matrix to add support for your device, then compile it with Github Action in your own repo. For details, please refer to [ForkTheProject.md](https://github.com/fantastic-packages/packages/blob/master/ForkTheProject.md)**

- like this
```ini
# add your custom package feeds here
#
# src/gz example_feed_name http://www.example.com/path/to/files
src/gz fantastic_packages_luci https://fantastic-packages.github.io/packages/releases/21.02/packages/x86_64/luci
src/gz fantastic_packages_packages https://fantastic-packages.github.io/packages/releases/21.02/packages/x86_64/packages
src/gz fantastic_packages_special https://fantastic-packages.github.io/packages/releases/21.02/packages/x86_64/special
```
### Add usign pub-keys to opkg
- Download `https://fantastic-packages.github.io/packages/releases/<major.minor version>/<KEY-ID>.pub`
- Put to `/etc/opkg/keys/<key-id>`, note filename must be lowercase
- Fast script
```bash
KEYID=<KEY-ID>
mkdir -p /etc/opkg/keys 2>/dev/null
curl -sSL -o /etc/opkg/keys/${KEYID,,} "https://fantastic-packages.github.io/packages/releases/<major.minor version>/${KEYID}.pub"
```
- OR
```bash
opkg update
opkg install curl bash
curl -sSL "https://fantastic-packages.github.io/packages/releases/<major.minor version>/${KEYID}.sh" | bash
```
- OR

install [fantastic-feeds](https://github.com/openwrt-xiaomi/fantastic-feeds) by @remittor
