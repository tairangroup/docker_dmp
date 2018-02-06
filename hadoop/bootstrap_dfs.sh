#!/bin/bash

if [ ! -f /tmp/is_restart ]; then
 /opt/hadoop/bin/hdfs namenode -format
 touch /tmp/is_restart
fi

/opt/hadoop/sbin/start-all.sh

sleep 10

/opt/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver