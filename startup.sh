#!/bin/bash
# 定义Docker镜像名称
IMAGE_NAME="jmeter_image"
# 定义基础目录
BASE_DIR="/home/jmeter/ai_jmeter/jmeter_new"

cd ${BASE_DIR}

# 获取所有以 output 开头的目录名
OUTPUTS=$(ls -l | grep output | awk '{print $9}')

# 遍历所有匹配的目录
for output in $OUTPUTS; do
  # 构建完整的目录路径
  OUTPUT_DIR="${BASE_DIR}/${output}"
  # 如果目录存在，则删除它
  if [ -d "${OUTPUT_DIR}" ]; then
    echo "Deleting directory: ${OUTPUT_DIR}"
    rm -rf "${OUTPUT_DIR}"
  fi
done

# 定义要启动的容器数量, 默认 5 
NUM_CONTAINERS=${1:-5}
# 循环启动每个容器
for i in $(seq 1 $NUM_CONTAINERS)
do
  # 构建输出目录路径
  OUTPUT_DIR="${BASE_DIR}/output${i}"
  mkdir -p ${OUTPUT_DIR}
  cp ./test/target.jmx ${OUTPUT_DIR}/target.jmx
  cp ./test/keywords.txt ${OUTPUT_DIR}/keywords.txt
  # 构建容器名称
  CONTAINER_NAME="jmeter_${i}"
  # 启动Docker容器
  docker run --privileged -v "${OUTPUT_DIR}:/jmeter/output" -d "${IMAGE_NAME}" --name "${CONTAINER_NAME}"
done
echo "所有 jmeter 容器已启动 ！"