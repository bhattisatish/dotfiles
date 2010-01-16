# BIN
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
    PATH=$PATH:/usr/local/bin
    export PATH
fi

# Setting the path to custom scripts in bin folder
export PATH=$PATH:~/bin

#default text editor
export editor="mate -w"

# GIT
if [ -f ~/.git-completion.bash ]; then
source ~/.git-completion.bash
fi

# SQL
PATH=${PATH}:/usr/local/mysql/bin
export PGDATA=/usr/local/pgsql/bin

# Virtual Env
export WORKON_HOME=$HOME/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
if [ -f ~/development/python/virtualenvwrapper/virtualenvwrapper_bashrc ]; then
source ~/development/python/virtualenvwrapper/virtualenvwrapper_bashrc
fi

#Perforce
export P4CONFIG=.p4config

# Setting PATH for Current Python
export PATH=/usr/local/bin:"$PATH"
export PATH=/usr/local/Cellar/python/2.6.4/bin:"$PATH"
