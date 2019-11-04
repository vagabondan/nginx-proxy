#!/bin/bash

img=${1:-base}
os=${2:-ubuntu-bionic}
owner=${3:-tozd}

img_dir="docker-${img}"
dockerfile="${os}.dockerfile"

docker build -f ${img_dir}/${dockerfile} -t ${owner}/${img}:${os} ${img_dir}

