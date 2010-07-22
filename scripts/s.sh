#!/bin/sh
if [ $1 = "php" ]; then
    find $2 -name "*.php" |xargs grep --color $3
else
find $1 -name "*.[hc]" |xargs grep --color $2
fi
