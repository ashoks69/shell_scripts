#!/bin/bash

NUM1=$1
NUM2=$2

DATE=$(date)
echo "script executed at $DATE"

SUM=$(($NUM1+$NUM2))
echo "Sum of those 2 numbers is $SUM"