#!/bin/sh
find $1 -name "*.[hc]" |xargs grep --color $2
