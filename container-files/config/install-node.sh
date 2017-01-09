#!/bin/bash

NODE_VERSION="v7.4.0"

echo "=============================================================="
echo "Installing Node.JS ${NODE_VERSION}..."
echo "=============================================================="

cd /tmp
wget http://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION.tar.gz

tar -zxf node-$NODE_VERSION.tar.gz --no-same-owner
cd node-$NODE_VERSION
./configure
make && make install

rm -rf /tmp/{node,npm}*  && cd /tmp
echo && echo "Node.JS ${NODE_VERSION} installed." && echo
