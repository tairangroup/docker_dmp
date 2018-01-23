#!/bin/bash

if [ ! -f /tmp/is_dfs_format ]; then
 /opt/hadoop/bin/hdfs namenode -format
 touch /tmp/is_dfs_format
fi

/opt/hadoop/sbin/start-dfs.sh
