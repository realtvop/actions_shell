#!/bin/bash

sleep 30

# 检查cf.log文件是否存在
if [ ! -f "cf.log" ]; then
    echo "Error: cf.log file not found."
    exit 1
fi

# urlencode函数实现
urlencode() {
  local string="$1"
  echo "$string" | sed 's/:/%3A/g; s/\//%2F/g'
}

# 使用grep命令提取包含"https://*.trycloudflare.com"格式的行，并发送请求
grep -oE 'https://[a-zA-Z0-9.-]+\.trycloudflare\.com' cf.log | while read -r url; do
    # 对URL进行编码
    encoded_url=$(urlencode "$url")

    # 构建目标URL
    target_url="https://pub-gha-host.realtvop.eu.org/report?url=${encoded_url}"

    # 使用curl发送GET请求
    echo "Sending request to: $target_url"
    response=$(curl -s "$target_url")

    # 打印响应结果
    echo "Response: $response"
done

echo "Script completed."
