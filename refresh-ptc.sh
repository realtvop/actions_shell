#!/bin/bash

mkdir tmp
cd tmp

sudo apt install axel -y

# 设置 JSON 文件的 URL
json_url="https://ptc.realtvop.eu.org/pt_songs.json"

# 使用 curl 获取 JSON 文件内容，并提取其中所有被双引号引起来的链接
links=$(curl -s "$json_url" | grep -o '"https\?[^"]*"' | tr -d '"')

for ((i = 1; i <= 3; i++)); do
    # 遍历链接列表，使用 curl 访问每个链接
    for link in $links; do
        echo "访问链接: $link"
        # curl -s --progress-bar -O /dev/null "$link"
        axel "$link"
        # 这里你可以根据需要对访问结果进行处理，比如保存到文件或输出到终端
    done
    rm -rf *
done

