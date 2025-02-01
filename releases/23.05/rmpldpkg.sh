#!/bin/bash
BASE_DIR="$(cd "$(dirname $0)"; pwd)"
for arch in $(ls "$BASE_DIR"/packages/); do
  for feed in luci packages special; do
    echo clean $arch/$feed
    pushd "$BASE_DIR"/packages/$arch/$feed
    rmlist=$(ls -1 *.ipk | grep -Ev "^($(jq -rc '.packages|to_entries[]|"\(.key)_\(.value)"' index.json | tr '\n' '|' | sed 's,|$,,'))")
    [ -z "$rmlist" ] || rm -f $rmlist
    popd
  done
done
