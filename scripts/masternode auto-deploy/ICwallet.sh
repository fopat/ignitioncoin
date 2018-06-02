#!/bin/bash
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install -y make build-essential libtool software-properties-common autoconf libssl-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev \
libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev sudo automake git curl libdb4.8-dev \
bsdmainutils libdb4.8++-dev libminiupnpc-dev libgmp3-dev ufw fail2ban pkg-config libevent-dev libzmq
sudo apt-get ufw
sudo ufw allow OpenSSH
sudo ufw allow 44144-44145
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
cd ~/
git clone https://github.com/ignitioncoin/ignitioncoin.git
#cd ~/ignitioncoin/src/secp256k1
#chmod +x autogen.sh
#sudo ./autogen.sh
#sudo ./configure
#sudo make && sudo make install
#cd ~/ignitioncoin/src/leveldb
#sudo sh build_detect_platform build_config.mk .
cd ~/ignitioncoin/src/
sudo make -f makefile.unix
strip ~/ignitioncoin/ignitiond
sudo cp ~/ignitioncoin/bin/ignitiond ~/
sudo rm -rf ignitioncoin
echo 'LD_LIBRARY_PATH=/usr/local/lib && export LD_LIBRARY_PATH' > ~/.bash_aliases
#source ~/.bashrc
#wget https://raw.githubusercontent.com/ludoloops/Simplicity/master/config_wallet.sh
#chmod +x config_wallet.sh
#bash config_wallet.sh
