FROM centos:6

#RUN yum install -y supervisor openssh-server python-pip \  
#  && mkdir -p /var/run/sshd  \
#  && mkdir -p /var/log/supervisor \
#  && mkdir -p /etc/supervisor/conf.d

#RUN yum install -y python python-pip

RUN yum groupinstall -y 'development tools'; \
	yum install -y gcc tar xz gcc-gfortran zlib-devel bzip2-devel openssl-devel \
				xz-lib wget python-devel

RUN curl https://bootstrap.pypa.io/get-pip.py | python -

# Install python 2.7.9
ADD http://python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz /tmp/Python-2.7.9.tar.xz
RUN cd /tmp; \
    tar xvf Python-2.7.9.tar.xz; \
    cd  Python-2.7.9; \
    ./configure; \
    make; \
    make install

#RUN python /tmp/get-pip.py

#COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Fix up SSH, probably should rip this out in real deploy situations.
#RUN groupadd docker
#RUN useradd -d/home/docker -gdocker -m docker
#RUN echo 'docker:tcuser' | chpasswd
#RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

ADD src/requirements.txt /tmp/requirements.txt
ADD src/distro-requirements.txt /tmp/distro-requirements.txt
ADD https://github.com/kevinconway/rpmvenv/archive/master.zip /tmp/rpmenv.zip

# Install a virtual environment with all the dependencies
RUN pip install 'virtualenv==13.1.0'; \
	virtualenv -p /usr/local/bin/python2.7 /usr/local/python-venv; \
	source /usr/local/python-venv/bin/activate; \
	pip install -r /tmp/requirements.txt; \
	pip install -r /tmp/distro-requirements.txt; \
    mkdir /tmp/rpmenv; \
    unzip /tmp/rpmenv.zip -d /tmp/rpmenv; \
    cd /tmp/rpmenv/rpmvenv-master; \
    python setup.py install; \
    wget https://bootstrap.pypa.io/ez_setup.py -O - | python2.7 -

ENTRYPOINT "/bin/bash"