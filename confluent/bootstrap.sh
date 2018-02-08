#!/bin/bash

echo "==========================================="
echo "================ Start SSH ================"
echo "==========================================="
source bootstrap_ssh.sh

echo "==========================================="
echo "================ Start Hadoop ==============="
echo "==========================================="
source bootstrap_hadoop.sh

echo "==========================================="
echo "================ Start Confluent =========="
echo "==========================================="
source bootstrap_confluent.sh

source bootstrap_keep.sh