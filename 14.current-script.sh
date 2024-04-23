#!/bin/bash


variable="Hi"
echo "before calling other script:$variable"


./15.other-script.sh

echo "after calling other script:$variable"
