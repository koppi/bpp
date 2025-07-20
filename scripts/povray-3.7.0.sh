#!/usr/bin/env bash

# See http://www.povray.org/beta/source/

export POV_DIR=povray-3.7.0
export POV_CFG="--with-boost-lib=/usr/lib64 --prefix=/opt/povray-3.7.0 --program-prefix=pov-3.7.0- --enable-watch-cursor"

sudo apt-get -y install build-essential devscripts automake
sudo apt-get -y install libboost-dev libboost-thread-dev zlib1g-dev libpng-dev libjpeg-dev libtiff5-dev libopenexr-dev libsdl1.2-dev

# Note: if using Ubuntu 12.04, get libtiff4-dev instead of libtiff5-dev

git clone --depth 1 https://github.com/POV-Ray/povray.git $POV_DIR

cd $POV_DIR

git checkout 3.7-stable

cd unix

./prebuild.sh

cd ..

./configure $POV_CFG COMPILED_BY="Jakob Flierl <jakob.flierl@gmail.com>"

make -j5 all

# make check

sudo make install
