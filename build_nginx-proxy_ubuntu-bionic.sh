#!/bin/bash

os="ubuntu-bionic"
images="tozd/base tozd/runit tozd/nginx tozd/nginx-mailer tozd/nginx-cron vagabondan/nginx-proxy"

for img in $images 
do
  ./build_common.sh $img $os
done
