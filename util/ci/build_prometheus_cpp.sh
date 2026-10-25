#! /bin/bash -eu

# prometheus-cpp now does find_package(civetweb) against a system install
# (it no longer vendors civetweb). Both packages are needed: the dev package's
# CMake config references the "civetweb" binary package too.
sudo apt-get update
sudo apt-get install -y --no-install-recommends libcivetweb-dev civetweb

cd /tmp
git clone --recursive https://github.com/jupp0r/prometheus-cpp
mkdir prometheus-cpp/build
cd prometheus-cpp/build
cmake .. \
	-DCMAKE_INSTALL_PREFIX=/usr/local \
	-DCMAKE_BUILD_TYPE=Release \
	-DENABLE_TESTING=0
make -j$(nproc)
sudo make install

