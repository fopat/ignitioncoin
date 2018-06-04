#!/bin/bash
folder=~/.Ignition/
file=~/.Ignition/masternode.conf
file2=~/.Ignition/Ignition.conf
NODEIP=$(curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g'
)

if [ ! -d $folder ]
then
        echo "$folder doesn't exist"
        mkdir $folder
fi

if [ -e $file ]
then
        echo "$file exist, I delete it"
        rm $file
fi
if [ -e $file2 ]
then
        echo "$file2 exist, I delete it"
        rm $file2
fi

#read -p 'masternode name: ' name
read -p 'your masternode genkey (Step1): ' genkey
#read -p 'your masternode output (step4): ' output
#read -p 'id (number adter the long line in step 4): ' id
#read -p 'your ip: ' ip

function password
{
date +%s | sha256sum | base64 | head -c 32
}

#echo -e "$name $NODEIP:44144 $genkey $output $id" >> $file
echo -e "rpcuser=rpcuser
rpcpassword= `password`
rpcport=44145
port=44144
daemon=1
server=1
listen=1
staking=0
maxconnections=32
masternode=1
masternodeaddr=$NODEIP:44144
masternodeprivkey=$genkey" >> $file2

echo $pwd >> $file2

#echo -e "\n"
#echo "your $file:"
#cat $file

echo -e '\n'
echo "your $file2:"
cat $file2