
# How to fork the project and build the feed and image for yourself

1. fork all branches of repo: `packages` `releases`
2. exec `gen_new_apksign_key.sh` and `gen_new_gpg_key.sh` generate apksign&gpg key for yourself
   + `./keys/apksign/*.pub`
   + `./keys/apksign/*.sec`
   + `./keys/gpg/*.finger`
   + `./keys/gpg/*.pub`
   + `./keys/gpg/*.rev`
   + `./keys/gpg/*.sec`
3. goto `https://github.com/<your_fork>/settings/secrets/actions`, add your secret keys
   + `GPG_<your_gpg_key-id>`: <your_gpg_sec-key>
   + `GPG_PW_<your_gpg_key-id>`: <your_gpg_sec-key_passwd>
   + `APK_SIGN_<your_apksign_key-id>`: <your_apksign_sec-key>
4. goto `https://github.com/<your_fork>/settings/variables/actions`, add your public keys
   + `GPG_ID`: <your_gpg_key-id>
   + `GPG_PUB_<your_gpg_key-id>`: <your_gpg_pub-key>
   + `GPG_FING_<your_gpg_key-id>`: <your_gpg_finger>
   + `APK_SIGN_ID`: <your_apksign_key-id>
   + `APK_SIGN_PUB_<your_apksign_key-id>`: <your_apksign_pub-key>
   + `APK_SIGN_VERIFY_KEY_ID`: 20241123170031
5. if you need to use other external feeds to build a image, you need to put their apksign pub-keys in the specified location and add them to the `VERIFY_KEY_ID`
   + `./keys/apksign/<external_feeds_apksign_key-id>.pub`
   + `APK_SIGN_VERIFY_KEY_ID`: "20241123170031 <the_apksign_key-ids,_with_spaces_as_separators>"
6. modify [ version, arch, target, profile, no_img ] matrix to replace the target devices
   + edit [AutoBuild.yml](./.github/workflows/AutoBuild.yml)
   + modify the values ​​in `jobs:compile:strategy:matrix` according to the actual situation
   + available `target, arch` can refer to [targets.txt](./targets.txt)
   + available `profile` can refer to `https://downloads.openwrt.org/releases/<version>/targets/<target[0]>/<target[1]>/config.buildinfo`

7. adjust the imagebuilder preinstalled packages
   + modify [./.github/workflows/prebuildpackages/generic](./.github/workflows/prebuildpackages/generic)
   + modify `./.github/workflows/prebuildpackages/<arch>`
