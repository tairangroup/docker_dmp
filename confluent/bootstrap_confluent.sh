#!/bin/bash

nohup /opt/confluent/bin/kafka-server-start /opt/confluent/etc/kafka/server.properties &
nohup /opt/confluent/bin/schema-registry-start /opt/confluent/etc/schema-registry/schema-registry.properties &