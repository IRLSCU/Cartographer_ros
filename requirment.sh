#! /bin/bash

set -e
# Install the required libraries that are available as debs.
echo "install some required lib !"
sudo apt-get update
sudo apt-get install -y \
    cmake \
    g++ \
    git \
    google-mock \
    libboost-all-dev \
    libcairo2-dev \
    libeigen3-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    liblua5.2-dev \
    libprotobuf-dev \
    libsuitesparse-dev \
    libwebp-dev \
    ninja-build \
    protobuf-compiler \
    python-sphinx

# ceres
echo "install ceres-solver"
cd ceres-solver
mkdir build
cd build
cmake ..
make -j 12
sudo make install -j 12
cd ../.. # cd root


# prtobuf
echo "install protobuf"
cd protobuf
git checkout v3.6.1
mkdir build
cd build
cmake  \
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -Dprotobuf_BUILD_TESTS=OFF \
  ../cmake
make -j 12
sudo make install -j 12
cd ../.. # cd root

# cartographer
echo "install cartographer"
cd cartographer
mkdir build
cd build
cmake ..
make -j12
sudo make install -j 12
cd ../.. # cd root

# cartographer_ros
echo "install cartographer_ros"
cd cartographer_ros
catkin_make

