#!/bin/bash

set -euo pipefail

input_files=""
output_file=""
size=""

OPTIND=1
while getopts "h?o:r:s:" opt; do
    case "$opt" in
    h|\?)
        echo "Use wisely"
        exit 0
        ;;
    o)  output_file=$OPTARG
        ;;
    s)  size=$OPTARG
        ;;
    esac
done
shift $((OPTIND-1))
[ "${1:-}" = "--" ] && shift

tmp_dir=$(mktemp -d -p .)
rootfs_dir="${tmp_dir}"/rootfs
mkdir -p ${rootfs_dir}

for input_file in "$@"
do
    fakeroot /bin/bash -c "tar xf ${input_file} -C ${rootfs_dir} --no-same-owner"
done
fakeroot /bin/bash -c "genext2fs -b ${size} -d ${rootfs_dir} ${tmp_dir}/rootfs.ext2"

mv "${tmp_dir}"/rootfs.ext2 ${output_file}

rm -rf ${tmp_dir}
