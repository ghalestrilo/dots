#!/bin/bash

# Install Dependencies
sudo apt-get install \
    libsamplerate0-dev \
    libsndfile1-dev \
    libasound2-dev \
    libavahi-client-dev \
    libreadline-dev \
    libfftw3-dev \
    libudev-dev \
    libncurses5-dev \
    cmake \
    git \

# Clone Sources
buildfolder='build/jack'
[ ! -d $buildfolder ] && git clone git://github.com/jackaudio/jack2 --depth 1 $buildfolder

# Build
cd $buildfolder
./waf configure --alsa --libdir=/usr/lib/arm-linux-gnueabihf/
./waf build
sudo ./waf install
sudo ldconfig
cd ~/git/dots
# rm -rf jack2

# Update Security Limits
limits="/etc/security/limits.conf"
if ! grep '@audio - memlock' $limits > /dev/null; then
  echo "Updating limits.conf";
  sudo sh -c "echo @audio - memlock 256000 >> $limits"
  sudo sh -c "echo @audio - rtprio 75 >> $limits"
fi


# exit # and ssh in again to make the limits.conf settings work


