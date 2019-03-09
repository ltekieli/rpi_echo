#!/bin/bash

set -e

boot_file=""
genimagecfg_file=""
rootfs_file=""
input_files=""
output_file=""

OPTIND=1
while getopts "h?b:g:o:r:" opt; do
    case "$opt" in
    h|\?)
        echo "Use wisely"
        exit 0
        ;;
    b)  boot_file=$OPTARG
        ;;
    g)  genimagecfg_file=$OPTARG
        ;;
    o)  output_file=$OPTARG
        ;;
    r)  rootfs_file=$OPTARG
        ;;
    esac
done
shift $((OPTIND-1))
[ "${1:-}" = "--" ] && shift

tmp_dir=$(mktemp -d -p .)
rootfs_dir="${tmp_dir}"/rootfs

cp ${boot_file} ${tmp_dir}/
mkdir -p ${rootfs_dir}

fakeroot /bin/bash -c "tar xf ${rootfs_file} -C ${rootfs_dir} --no-same-owner"
for input_file in "$@"
do
    fakeroot /bin/bash -c "tar xf ${input_file} -C ${rootfs_dir} --no-same-owner"
done
fakeroot /bin/bash -c "genext2fs -b 250000 -d ${rootfs_dir} ${tmp_dir}/rootfs.ext2"

genimage                                    \
    --rootpath "${rootfs_dir}"              \
    --tmppath "${tmp_dir}/genimage.tmp"     \
    --inputpath "${tmp_dir}"                \
    --outputpath "${tmp_dir}"               \
    --config "${genimagecfg_file}"

mv "${tmp_dir}"/sdcard.img ${output_file}

rm -rf ${tmp_dir}
