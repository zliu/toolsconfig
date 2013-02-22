#!/bin/sh

find $PWD -name "*.[chlyS]" > cscope.files
cscope -Rkqb -i cscope.files
ctags -R --sort=foldcase  --c-kinds=+p --fields=+S $PWD
