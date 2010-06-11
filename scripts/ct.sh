#!/bin/sh
ctags -R --sort=foldcase  --c-kinds=+p --fields=+S $PWD
