FROM centos:6

RUN yum groupinstall -y 'development tools'; \
	yum install -y gcc tar xz gcc-gfortran zlib-devel bzip2-devel openssl-devel \
				xz-lib wget python-devel

# Install python 2.7.9
#ADD http://python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz /tmp/Python-2.7.9.tar.xz
#RUN cd /tmp; \
#    tar xvf Python-2.7.9.tar.xz; \
#    cd  Python-2.7.9; \
#    mkdir -p /usr/local/python-distro/python2.7; \
#    ./configure --prefix=/usr/local/python-distro/python2.7; \
#    make; \
#    make install
    
#RUN curl https://bootstrap.pypa.io/get-pip.py | python2.7 -    

ENTRYPOINT "/bin/bash"