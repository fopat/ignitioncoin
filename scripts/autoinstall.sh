#!/bin/bash

# Variables
IC_AUTOINSTALLER_DIR="$HOME/ignitioncoin-autoinstaller"

# Install Git
sudo apt-get install git

# Clone the IC repo in ~/ignitioncoin-autoinstaller
# Or update the repo if already exists
if [ -d $IC_AUTOINSTALLER_DIR/ignitioncoin ]; then
	cd $IC_AUTOINSTALLER_DIR/ignitioncoin
	git checkout master
	git pull
else
	mkdir -p $IC_AUTOINSTALLER_DIR
	cd $IC_AUTOINSTALLER_DIR
	git clone https://github.com/ignitioncoin/ignitioncoin
	cd ignitioncoin
fi

# Call the installer script
cd scripts
./install.sh $@

