#!/bin/bash

os="ubuntu-bionic"
images="base runit nginx nginx-mailer nginx-cron nginx-proxy"

for img in $images 
do
  ./build_common.sh $img $os
done
