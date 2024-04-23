#!/bin/bash


variable="Hi"
echo "current script"
echo "variable do not changed:$variable"

./ 15.other-script.sh

echo "variable changed:$variable"
