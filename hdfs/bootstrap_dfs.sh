#!/bin/bash

if [ ! -f /tmp/is_restart ]; then
 /opt/hadoop/bin/hdfs namenode -format
 touch /tmp/is_restart
fi

/opt/hadoop/sbin/start-dfs.sh
