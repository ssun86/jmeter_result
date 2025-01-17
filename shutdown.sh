#!/bin/bash

# 获取所有名为 'jmeter_image' 的容器的 ID
CONTAINER_IDS=$(docker ps | grep 'jmeter_image' | awk '{print $1}')

# 循环停止并移除每个容器
for CONTAINER_ID in $CONTAINER_IDS
do
  # 停止容器
  docker stop "$CONTAINER_ID"
  # 移除容器
  docker rm "$CONTAINER_ID"
done

# 获取所有名为 'jmeter_image' 的已停止容器的 ID
CONTAINER_IDS2=$(docker ps -a | grep 'jmeter_image' | awk '{print $1}')

# 循环停止并移除每个容器
for CONTAINER_ID2 in $CONTAINER_IDS2
do
  # 移除容器
  docker rm "$CONTAINER_ID2"
done

echo "所有 jmeter 容器已停止并移除 ！"