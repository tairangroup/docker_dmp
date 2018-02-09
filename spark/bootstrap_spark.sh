#!/bin/bash

/opt/hadoop/bin/hdfs dfs -mkdir -p /kylin/spark
/opt/hadoop/bin/hdfs dfs -mkdir /spark-log
/opt/hadoop/bin/hdfs dfs -put /opt/spark/jars/* /kylin/spark/
/opt/spark/sbin/start-all.sh

/opt/spark/sbin/start-thriftserver.sh