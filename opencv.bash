#!/bin/bash
# Installs OpenCV 3.1.0 on Edubuntu or Ubuntu 14.04 using python 2.7
# based off of docs.opencv.org/master/d7/d9f/tutorial_linux_install.html
# Kati Williams and Jeremy Scofield 2/5/2016.
echo " This script will download, compile, and install opencv version 3.1.0.

"
sudo apt-get update -y
sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev
sudo apt-get install -y libavformat-dev libswscale-dev
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev
sudo apt-get install -y libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
sudo apt-get install -y idle doxygen

git clone https://github.com/Itseez/opencv.git
git clone https://github.com/Itseez/opencv_contrib.git
#git clone https://github.com/Itseez/opencv_extra.git
cd opencv
mkdir release
cd release
 

cmake -D CMAKE_BUILD_TYPE=RELEASE -D WITH_TBB=ON -D BUILD_TBB=ON -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules -D CMAKE_INSTALL_PREFIX=/usr/local ~/opencv
make -j6
sudo make install

