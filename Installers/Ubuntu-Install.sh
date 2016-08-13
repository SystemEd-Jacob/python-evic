#!/bin/sh

echo Please enter your password to continue...

# Install the following dependencies from repositories without asking questions, git-core can be removed afterwords as it's only used to initialise a local git repository
echo Installing dependencies
sudo apt-get -y install git-core python3 cython3 libusb-1.0.0 python3-pip

# Install the hidapi dependency
sudo pip install hidapi

# Get the sudoers home directory before changing directory into it
cd ~

# Make a directory called python-evic under the sudoers home directory
mkdir python-evic

# Clone the pythin-evic repository the change directory into it
echo Cloning python-evic repository
git clone git://github.com/Ban3/python-evic.git ./python-evic && cd ./python-evic

# Install python-evic
echo Installing python-evic
sudo python3 setup.py install

echo Installation complete. Run \"sudo evic-usb upload /path/to/firmware.bin\" to install a new firmware.
