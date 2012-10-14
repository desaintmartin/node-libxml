#!/bin/sh

cd `dirname $0`
ls -l
ls -l support
sudo ls -l
sudo ls -l support
cd support/o3

rm -rf build/ || true
node tools/gluegen.js
node-waf -vv configure
node-waf -vv

if [ -f build/default/o3.node ]
then
    cp build/default/o3.node ../../lib/libxml
else
    cp build/Release/o3.node ../../lib/libxml
fi
