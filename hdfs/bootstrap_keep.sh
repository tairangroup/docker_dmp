#!/bin/bash

if [ $1 = 'true' ] ; then
    echo "Keep Running..."
    tail -f /dev/null
fi
