#!/bin/sh

find $PWD -name "*.[chlyS]" > cscope.files
cscope -Rkqb -i cscope.files
ctags -R --sort=foldcase  --fields=+S $PWD
