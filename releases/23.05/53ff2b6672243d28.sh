#!/bin/sh
KEYID=53ff2b6672243d28
mkdir -p /etc/opkg/keys 2>/dev/null
cat <<- PUBKEY > /etc/opkg/keys/${KEYID}
untrusted comment: Public usign key for fantastic-packages builds
RWRT/ytmciQ9KFjHE8DQ97piX7oHvdr49H3VLlJDuJNmuaKFguOrwXBG
PUBKEY
