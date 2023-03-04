#!/bin/bash
PWSIZE=16
PW=$(echo $(cat /dev/urandom 2>/dev/null | head -n 8 | md5sum | cut -c 1-${PWSIZE}))
FINGERPRINT=
KEYSIZE=4096
EXPIRE=0
NAME="fantastic packages"
MAIL="fantastic-packages@users.noreply.github.com"
#
out=$(gpg --full-gen-key --batch <(echo "Key-Type: 1"; \
                                   echo "Key-Length: ${KEYSIZE}"; \
                                   echo "Subkey-Type: 1"; \
                                   echo "Subkey-Length: ${KEYSIZE}"; \
                                   echo "Expire-Date: ${EXPIRE}"; \
                                   echo "Name-Real: ${NAME}"; \
                                   echo "Name-Email: ${MAIL}"; \
                                   echo "Passphrase: ${PW}"; ) 2>&1)
#                                  echo "%no-protection"; ) 2>&1)
#
key_id="$(echo "$out"|sed -En 's|.+key ([[:xdigit:]]+) marked.+|\1|p')"
rev_cert="$(echo "$out"|sed -En "s|.+revocation certificate stored as '([^']+)'.*|\1|p")"
finger="$(gpg --fingerprint ${key_id}|sed -n '2{s|^\s*||p}')"
#
if [ -n "$key_id" -a -n "$rev_cert" ]; then
    echo $PW > keys/gpg/${key_id^^}.pw
    echo $finger > keys/gpg/${key_id^^}.finger
    cp "$rev_cert" keys/gpg/${key_id^^}.rev && rm "$rev_cert" 2>/dev/null
    #gpg -a -o ${key_id^^}.sec --export-secret-key ${key_id} && gpg --delete-secret-keys ${key_id}
    gpg -a -o keys/gpg/${key_id^^}.sec --batch --pinentry-mode=loopback --yes --passphrase "$PW" --export-secret-key ${key_id} && gpg --delete-secret-keys ${key_id}
    gpg -a -o keys/gpg/${key_id^^}.pub --export ${key_id} && gpg --batch --yes --delete-keys ${key_id}
else
    >&2 echo "gpg key generation failed." && exit 1
fi
