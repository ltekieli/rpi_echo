#!/bin/bash

set -e

image_file=""
device_file=""

OPTIND=1
while getopts "h?i:d:" opt; do
    case "$opt" in
    h|\?)
        echo "Use wisely"
        exit 0
        ;;
    i)  image_file=$OPTARG
        ;;
    d)  device_file=$OPTARG
        ;;
    esac
done
shift $((OPTIND-1))
[ "${1:-}" = "--" ] && shift

if [ -z "$image_file" ]; then
    echo "ERROR: Image file not specified"
    exit 1
fi

if [ -z "$device_file" ]; then
    echo "ERROR: Device not specified"
    exit 1
fi

sudo dd if="$image_file" of="$device_file" bs=4M
sudo sync
