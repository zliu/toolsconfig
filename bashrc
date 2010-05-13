# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias diff='colordiff'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
export PATH=/root/toolsconfig/scripts:/opt/montavista/pro/devkit/ppc/82xx/bin:$PATH
export PS1="\[\e[1;32m\][\[\e[0;1;5;33m\]\u\[\e[0;1;31m\]@\h \[\e[36m\]\W\[\e[32m\]]\$ \[\e[1m\]"
