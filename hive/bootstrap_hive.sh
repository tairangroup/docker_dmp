#!/bin/bash

/opt/hadoop/bin/hdfs dfs -mkdir -p /user/hive/warehouse
/opt/hadoop/bin/hdfs dfs -mkdir -p /user/hive/tmp
/opt/hadoop/bin/hdfs dfs -mkdir -p /user/hive/log
/opt/hadoop/bin/hdfs dfs -chmod -R 777 /user/hive/warehouse
/opt/hadoop/bin/hdfs dfs -chmod -R 777 /user/hive/tmp
/opt/hadoop/bin/hdfs dfs -chmod -R 777 /user/hive/log

/opt/hive/bin/schematool -dbType mysql -initSchema hive hive

nohup /opt/hive/bin/hiveserver2 &