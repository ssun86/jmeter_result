#!/bin/bash

sh ./shutdown.sh

# 获取所有名为 'jmeter_image' 的容器的 ID
CONTAINER_IDS=$(docker images | grep 'jmeter_image' | awk '{print $3}')

# 循环停止并移除每个容器
for CONTAINER_ID in $CONTAINER_IDS
do
  # 移除容器
  docker rmi "$CONTAINER_ID"
done

echo "旧的 jmeter 镜像已移除 ！"

docker build -t jmeter_image .

echo "新的 jmeter 镜像已建立 ！"