#!/bin/sh
KEYID=20241123170031
mkdir -p /etc/apk/keys 2>/dev/null
cat <<- PUBKEY > /etc/apk/keys/fantastic-packages-${KEYID}.pem
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEP1bBDT4R1QuhUWY5qqI1FNQ0rshE
Oh51xeVcLaZoYkUWNTBUtlTQNGsWIcFFn66cun4DFY1kLTzF8k5V140ZXg==
-----END PUBLIC KEY-----

PUBKEY
