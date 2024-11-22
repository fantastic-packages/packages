#!/bin/bash

KEY_DIR=keys/apksign
BUILD_KEY_APK_SEC=$KEY_DIR/private-key.pem
BUILD_KEY_APK_PUB=$KEY_DIR/public-key.pem
openssl ecparam -name prime256v1 -genkey -noout -out $BUILD_KEY_APK_SEC
openssl ec -in $BUILD_KEY_APK_SEC -pubout > $BUILD_KEY_APK_PUB
KEY_ID=$(date +%F%T | tr -d '\-:' | tr 'a-z' 'A-Z')
mv $BUILD_KEY_APK_SEC $KEY_DIR/${KEY_ID}.sec
mv $BUILD_KEY_APK_PUB $KEY_DIR/${KEY_ID}.pub
sed -i 's/\r//g' $KEY_DIR/${KEY_ID}.*
