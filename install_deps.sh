#!/bin/sh -ex

wget https://download.osgeo.org/proj/proj-9.5.1.tar.gz
tar -xvzf proj-9.5.1.tar.gz
cd proj-9.5.1
mkdir build
cd build
cmake ..
cmake --build .
sudo cmake --build . --target install
