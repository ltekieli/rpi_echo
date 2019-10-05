#!/bin/bash

set -euo pipefail

genimagecfg_file=""
input_files=""
output_file=""

OPTIND=1
while getopts "h?g:o:" opt; do
    case "$opt" in
    h|\?)
        echo "Use wisely"
        exit 0
        ;;
    g)  genimagecfg_file=$OPTARG
        ;;
    o)  output_file=$OPTARG
        ;;
    esac
done
shift $((OPTIND-1))
[ "${1:-}" = "--" ] && shift

tmp_dir=$(mktemp -d -p .)

for input_file in "$@"
do
    cp ${input_file} ${tmp_dir}/
done

genimage                                    \
    --rootpath "$(mktemp -d)"               \
    --tmppath "${tmp_dir}/genimage.tmp"     \
    --inputpath "${tmp_dir}"                \
    --outputpath "${tmp_dir}"               \
    --config "${genimagecfg_file}"

mv "${tmp_dir}"/sdcard.img ${output_file}

rm -rf ${tmp_dir}
