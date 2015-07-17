#!/bin/bash

[ -z "$VIRTUAL_ENV" ] && source /usr/local/python-venv/bin/activate

mkdir -p /usr/local/python-distro-src
yes | cp -rf /usr/local/python-distro/* /usr/local/python-distro-src 
pushd /usr/local/python-distro-src/src &> /dev/null
rm -f python_distro-*.rpm
echo "Start creating RPM"
rpmvenv python-distro.json
yes | cp -f *.rpm /usr/local/python-distro/
echo "Finished creating RPM"
popd &> /dev/null
