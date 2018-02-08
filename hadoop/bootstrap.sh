#!/bin/bash

echo "==========================================="
echo "================ Start SSH ================"
echo "==========================================="
source bootstrap_ssh.sh

echo "==========================================="
echo "================ Start Hadoop ==============="
echo "==========================================="
source bootstrap_hadoop.sh

source bootstrap_keep.sh