#!/bin/bash

wget http://python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz -O /tmp/Python-2.7.9.tar.xz
pushd /tmp &> /dev/null
tar xvf Python-2.7.9.tar.xz
mkdir -p /usr/local/python-distro/python2.7
pushd Python-2.7.9 &> /dev/null 
configure --prefix=/usr/local/python-distro/python2.7
make
make install
popd &> /dev/null
popd &> /dev/null