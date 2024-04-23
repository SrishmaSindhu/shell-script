#!/bin/bash


variable="Hi"
echo "before calling other script:$variable"
echo "process instance id of current script:$$"


#./15.other-script.sh
source ./15.other-script.sh


echo "after calling other script:$variable"
