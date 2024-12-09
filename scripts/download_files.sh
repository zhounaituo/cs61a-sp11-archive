#!/bin/bash

# download_files.sh 1.1 "plural2.scm,plural1.scm" ./resource/lec/1.1

# 接受两个参数，第一个是文件列表，第二个是目标目录
source_dir=$1
files=$2
target_dir=$3

# 基本URL
base_url="https://people.eecs.berkeley.edu/~bh/61a-pages/Lectures/${source_dir}/"

# 将文件列表转换为数组
IFS=',' read -ra file_array <<< "$files"

# 检查目标目录是否存在，如果不存在则创建
if [ ! -d "$target_dir" ]; then
    mkdir -p "$target_dir"
fi

# 循环下载文件并保存到目标目录
for file in "${file_array[@]}"; do
    curl -o "${target_dir}/${file}" "${base_url}${file}"
done