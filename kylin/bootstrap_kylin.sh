#!/bin/bash


/opt/hadoop/bin/hdfs dfs -mkdir -p /tmp
/opt/hadoop/bin/hdfs dfs -chmod -R 777 /tmp

#导入样例数据
/opt/kylin/bin/sample.sh
#
/opt/kylin/bin/kylin.sh start

