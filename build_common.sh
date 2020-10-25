#!/bin/bash

img=${1:-base}
os=${2:-ubuntu-bionic}

img_dir="docker-${img}"
dockerfile="${os}.dockerfile"

docker build -f ${img_dir}/${dockerfile} -t ${img}:${os} ${img_dir}

