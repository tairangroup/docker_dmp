#!/bin/bash

IP=$(grep "\s${HOSTNAME}$" /etc/hosts | head -n 1 | awk '{print $1}')

cat /opt/confluent/etc/kafka/server.properties.template | sed \
  -e "s|{{KAFKA_ADVERTISED_HOST_NAME}}|${KAFKA_ADVERTISED_HOST_NAME:-$IP}|g" \
  -e "s|{{KAFKA_ADVERTISED_PORT}}|${KAFKA_ADVERTISED_PORT:-9092}|g" \
  -e "s|{{KAFKA_PORT}}|${KAFKA_PORT:-9092}|g" \
   > /opt/confluent/etc/kafka/server.properties

nohup /opt/confluent/bin/kafka-server-start /opt/confluent/etc/kafka/server.properties >/dev/null 2>&1 &
sleep 5
nohup /opt/confluent/bin/schema-registry-start /opt/confluent/etc/schema-registry/schema-registry.properties >/dev/null 2>&1 &