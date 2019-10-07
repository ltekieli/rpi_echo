#!/bin/bash

set -x

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
fakeroot /bin/bash -c "genext2fs -b ${size} -i 1024 -d ${rootfs_dir} ${tmp_dir}/rootfs.ext4"

tune2fs -U random "${tmp_dir}"/rootfs.ext4
tune2fs -O filetype,extents,uninit_bg,dir_index -j -J size=1 "${tmp_dir}"/rootfs.ext4

ret=0
e2fsck -yDf "${tmp_dir}"/rootfs.ext4 >/dev/null || ret=$?
case ${ret} in
   0|1|2) ;;
   *)   exit ${ret};;
esac

tune2fs -c 0 -i 0 "${tmp_dir}"/rootfs.ext4

mv "${tmp_dir}"/rootfs.ext4 ${output_file}

rm -rf ${tmp_dir}
