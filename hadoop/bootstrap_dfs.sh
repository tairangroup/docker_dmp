#!/bin/bash

if [ ! -f /tmp/is_dfs_format ]; then
 /opt/hadoop/bin/hdfs namenode -format
 touch /tmp/is_dfs_format
fi

/opt/hadoop/sbin/start-all.sh

sleep 10

/opt/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver