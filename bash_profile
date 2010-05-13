# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
pushd /root/projects/OCTEON-SDK
source env-setup OCTEON_CN56XX_PASS2
popd
