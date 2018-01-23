#!/bin/bash

/opt/hbase/bin/start-hbase.sh

sleep 10

nohup /opt/phoenix/bin/queryserver.py start >/dev/null 2>&1 &