#!/bin/sh

find $PWD -name "*.[chlyS]" > cscope.files
cscope -qb -i cscope.files
