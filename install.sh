#!/bin/bash

# If needed as reference
# rpm -Uvh http://archives.fedoraproject.org/pub/archive/epel/5/x86_64/epel-release-5-4.noarch.rpm
# yum install git

export LD_LIBRARY_PATH=/root/src/lib

# mkdir /root/src && cd /root/src

# wget https://www.openssl.org/source/openssl-1.0.2p.tar.gz
# wget https://dl.uxnr.de/mirror/curl/curl-7.59.0.tar.gz
# wget https://github.com/git/git/archive/v2.16.3.tar.gz
# mv v2.16.3.tar.gz git-2.16.3.tar.gz

# tar -xzvf openssl-1.0.2p.tar.gz
# tar -xzvf curl-7.59.0.tar.gz
# tar -xzvf git-2.16.3.tar.gz

cd openssl-1.0.2p
./config --prefix=/root/src -fpic shared
make -j16
make -j16 install
cd ../

cd curl-7.59.0
./configure --with-ssl=/root/src/ --prefix=/root/src/
make -j16
make install
ldd /root/src/lib/libcurl.so.4.5.0 #verify shared libraries
cd ../

cd git-2.16.3
make configure
./configure --prefix=/root/src/ --with-openssl=/root/src/ --with-curl=/root/src/
make -j16
make install
ldd /root/src/libexec/git-core/git-remote-https #verify shared libraries

# Handy commands
# echo | openssl s_client -connect bitbucket.org:443 | grep Protocol
# GIT_CURL_VERBOSE=1 /root/src/bin/git ls-remote https://bitbucket.org/
