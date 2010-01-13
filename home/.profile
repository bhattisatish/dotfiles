if [ -f ~/.bashrc ]; 
then
    source ~/.bashrc
fi

# GCC fix for OSX (libjpeg) http://bit.ly/5M3eUC
export CC=/usr/bin/gcc-4.2 export CPP=/usr/bin/cpp-4.2 export CXX=/usr/bin/g++-4.2 
