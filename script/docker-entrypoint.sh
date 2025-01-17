#!/bin/bash

# 执行JMeter测试
jmeter -n -t /jmeter/output/target.jmx -l /jmeter/output/report.jtl -j /jmeter/output/report.log &

# 获取JMeter进程的PID
JMETER_PID=$!

echo "JMeter test executing."

# 等待JMeter进程结束
wait $JMETER_PID

# 检查命令执行的返回状态
if [ $? -eq 0 ]; then
    echo "JMeter test executed successfully."
else
    echo "JMeter test failed to execute."
fi

# 保持容器运行
#tail -f /dev/null