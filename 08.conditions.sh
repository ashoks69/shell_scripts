#!/bin/bash

NUMBER=$1

#gt = greater than
#lt = less than
#eq = equal
#ne = not equal
#ge = greater than or equal
#le = less than or equal

if [ $NUMBER -gt 10 ]
then
    echo "Number is greater than 10"
elif [ $NUMBER -lt 10 ]
then
    echo "Number is less than 10"
else
    echo "Number is equal to 10"
fi