
# How to fork the project and build the feed and image for yourself

1. fork all branches of repo: `packages` `releases`
2. exec `gen_new_usign_key.sh` and `gen_new_gpg_key.sh` generate usign&gpg key for yourself
   + `./keys/usign/*.pub`
   + `./keys/usign/*.sec`
   + `./keys/gpg/*.finger`
   + `./keys/gpg/*.pub`
   + `./keys/gpg/*.rev`
   + `./keys/gpg/*.sec`
3. goto `https://github.com/<your_fork>/settings/secrets/actions`, add your secret keys
   + `GPG_<your_gpg_key-id>`: <your_gpg_sec-key>
   + `GPG_PW_<your_gpg_key-id>`: <your_gpg_sec-key_passwd>
   + `USIGN_<your_usign_key-id>`: <your_usign_sec-key>
4. goto `https://github.com/<your_fork>/settings/variables/actions`, add your public keys
   + `GPG_ID`: <your_gpg_key-id>
   + `GPG_PUB_<your_gpg_key-id>`: <your_gpg_pub-key>
   + `GPG_FING_<your_gpg_key-id>`: <your_gpg_finger>
   + `USIGN_ID`: <your_usign_key-id>
   + `USIGN_PUB_<your_usign_key-id>`: <your_usign_pub-key>
   + `VERIFY_KEY_ID`: 53FF2B6672243D28
5. if you need to use other external feeds to build a image, you need to put their usign pub-keys in the specified location and add them to the `VERIFY_KEY_ID`
   + `./keys/usign/<external_feeds_usign_key-id>.pub`
   + `VERIFY_KEY_ID`: "53FF2B6672243D28 <the_usign_key-ids,_with_spaces_as_separators>"
6. modify [ version, arch, target, profile, no_img ] matrix to replace the target devices
   + edit [AutoBuild.yml](./.github/workflows/AutoBuild.yml)
   + modify the values ​​in `jobs:compile:strategy:matrix` according to the actual situation
   + available `target, arch` can refer to [targets.txt](./targets.txt)
   + available `profile` can refer to `https://downloads.openwrt.org/releases/<version>/targets/<target[0]>/<target[1]>/config.buildinfo`

7. adjust the imagebuilder preinstalled packages
   + modify [./.github/workflows/prebuildpackages/generic](./.github/workflows/prebuildpackages/generic)
   + modify `./.github/workflows/prebuildpackages/<arch>`
