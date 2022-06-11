#!/bin/bash

os="ubuntu-bionic"
target_image="vagabondan/nginx-proxy"
images="tozd/base tozd/runit tozd/nginx tozd/nginx-mailer tozd/nginx-cron ${target_image}"

# git submodule init
# git submodule update

for img in $images 
do
  ./build_common.sh $img $os
done

docker push ${target_image}:${os}
