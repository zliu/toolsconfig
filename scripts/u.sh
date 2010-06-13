#!/bin/sh

ctags -R --sort=foldcase  --c-kinds=+p --fields=+S $PWD
find $PWD -name "*.[chlyS]" > cscope.files
cscope -qb -i cscope.files
