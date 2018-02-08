#!/bin/bash

/opt/hadoop/bin/hdfs dfs -mkdir -p /user/hive/warehouse
/opt/hadoop/bin/hdfs dfs -mkdir -p /user/hive/tmp
/opt/hadoop/bin/hdfs dfs -mkdir -p /user/hive/log
/opt/hadoop/bin/hdfs dfs -chmod -R 777 /user/hive/warehouse
/opt/hadoop/bin/hdfs dfs -chmod -R 777 /user/hive/tmp
/opt/hadoop/bin/hdfs dfs -chmod -R 777 /user/hive/log

if [ ! -f /tmp/is_init_schema ]; then
 /opt/hive/bin/schematool -dbType mysql -initSchema hive hive
 touch /tmp/is_init_schema
fi

nohup /opt/hive/bin/hive --service metastore >/dev/null 2>&1 &
nohup /opt/hive/bin/hiveserver2 >/dev/null 2>&1 &