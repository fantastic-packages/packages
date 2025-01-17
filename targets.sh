#!/bin/sh

# Ref: https://github.com/muink/luci-app-packagesync/blob/master/root/etc/init.d/packagesync#L126
OPENWRT_URL="https://downloads.openwrt.org"
VERSION="$( \
	curl -sL "$OPENWRT_URL/" | sed -En '/Stable Release/,/(Old|Upcoming) Stable Release/p' \
	| sed -n '/<ul>/,/<\/ul>/p' | grep 'OpenWrt' \
	| sed -E "s|.+\breleases/([\.0-9]+)/.+|\1|g" \
)"
TARGETS="$(curl -sL "$OPENWRT_URL/releases/$VERSION/targets/" \
	| sed -n '/<table>/,/<\/table>/p' | grep '<a href=' \
	| sed -E "s|.+\bhref=\"([^/]+)/.+|\1|g" \
)"

print_target_arch() {
for target in $TARGETS; do
	SUBTARGETS="$(curl -sL "$OPENWRT_URL/releases/$VERSION/targets/$target/" \
		| sed -n '/<table>/,/<\/table>/p' | grep '<a href=' \
		| sed -E "s|.+\bhref=\"([^/]+)/.+|\1|g" \
	)"
	for subtarget in $SUBTARGETS; do
		profiles="$(curl -sL "$OPENWRT_URL/releases/$VERSION/targets/$target/$subtarget/profiles.json")"
		printf "%-25s %s\n" "'$target/$subtarget'" "$(echo "$profiles" | jq -rc '.arch_packages' 2>/dev/null)"
	done
done
}

print_target_arch > targets.txt
