#!/bin/bash

# Variables
IC_BACKUP_FOLDER="$HOME/ignitioncoin-backup"
IC_BUILD_QT=false

# Arguments
for i in "$@"
do
case $i in
    -qt)
    	IC_BUILD_QT=true
	    shift # past argument with no value
    ;;
    *)
		shift # unknown option
    ;;
esac
done

# Dependencies
sudo apt-get install -y p7zip-full autoconf automake autopoint bash bison bzip2 cmake flex gettext git g++ gperf intltool libffi-dev libtool libltdl-dev libssl1.0-dev libxml-parser-perl make openssl patch perl pkg-config python ruby scons sed unzip wget xz-utils g++-multilib libc6-dev-i386 build-essential libboost-dev libboost-system-dev libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev libdb++-dev libminiupnpc-dev

if [ $IC_BUILD_QT = true ]; then
	sudo qt5-default qt5-qmake qtbase5-dev-tools qttools5-dev-tools
fi

# Kill and remove existing daemons
sudo killall -9 ignitiond
if [ -f "/usr/local/bin/ignitiond" ]; then
  sudo rm -f /usr/local/bin/ignitiond
fi
if [ -f "../bin/ignitiond" ]; then
  rm -f ../bin/ignitiond
fi

# Build the daemon
NB_CORES=`nproc`
cd ../src
make -j$NB_CORES -f makefile.unix
cd ..

# Build the QT wallet
if [ $IC_BUILD_QT = true ]; then
	qmake CONFIG+=debug
	make -j$NB_CORES
fi

# Install the daemon
sudo cp bin/ignitiond /usr/local/bin/

# Backup the data folder
if [ -d "$HOME/.Ignition/" ]; then
	cd $HOME/.Ignition/  
	if [ ! -d "$IC_BACKUP_FOLDER" ]; then
		mkdir -p $IC_BACKUP_FOLDER
	fi

	DATE=`date '+%Y%m%d-%H%M%S'`
	IC_CURRENT_BACKUP=$IC_BACKUP_FOLDER/$DATE
	mkdir $IC_CURRENT_BACKUP

	cp -r * $IC_CURRENT_BACKUP
	rm -rf smsgStore && rm -rf smsgDB && rm -f *.log && rm -f smsg.ini && rm -f blk* && rm -rf database && rm -rf txleveldb
fi
