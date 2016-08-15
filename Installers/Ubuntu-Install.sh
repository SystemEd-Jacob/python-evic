#!/bin/sh

echo Please enter your password to continue...

# Install the following dependencies from repositories without asking questions, git-core can be removed afterwords as it's only used to initialise a local git repository
echo Installing dependencies
sudo apt-get -y install git-core libusb-1.0.0 libudev-dev python3 cython3 python3-pip python3-pil python3-setuptools

cd /tmp
pip3 install hidapi click

# Build within /tmp
cd /tmp

# If the git repository already exists then delete it
if [ -d "python-evic" ]; then
  rm -Rf python-evic
fi

# Clone the pythin-evic repository the change directory into it
echo Cloning python-evic repository
git clone git://github.com/Ban3/python-evic.git && cd ./python-evic

# Install python-evic
echo Installing python-evic
sudo python3 setup.py install

# Cleanup
cd ../
rm -Rf python-evic

echo Installation complete. Run \"sudo evic-usb upload /path/to/firmware.bin\" to install a new firmware.
