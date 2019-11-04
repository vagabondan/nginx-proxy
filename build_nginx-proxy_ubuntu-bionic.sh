#!/bin/bash

os="ubuntu-bionic"
images="base runit nginx nginx-mailer nginx-cron"
target_image=nginx-proxy
owner=${3:-vagabondan}

for img in $images 
do
  ./build_common.sh $img $os
done

./build_common.sh ${target_image} $os $owner
docker push ${owner}/${target_image}
