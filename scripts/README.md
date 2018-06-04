# Scripts
Scripts assisting in building, integrating, or using Ignition Coin
This is instructions on how to use the auto deploy scripts for your VPS with headless linux a.k.a remote wallet or hot wallet in hotcold masternode setup.
There are 2 scripts :
  1. ICwallet.sh; this is to create the wallet.
  2. ICcongig.sh; this is to create Ignition.conf and entering parameters.
 
The steps are easy and basically is "download & run".
 
INSTALLING WALLET:
  1. cd ~
  2. wget https://github.com/TechniumUnlimited/ignitioncoin/blob/experimental/scripts/masternode%20auto-deploy/ICwallet.sh
  3. sudo ./ICwallet.sh
  
Wait until if finish. When it's done type ls and see if you can find file ignitiond. If you can't find it, try again and look for error message and ask for help in Discord. 
 
CONFIGURING WALLET:
Before you start make sure you already have the result from "masternode genkey" that you run in local wallet.
  1. cd ~
  2. wget https://github.com/TechniumUnlimited/ignitioncoin/blob/experimental/scripts/masternode%20auto-deploy/ICconfig.sh
  3. sudo ./ICconfig.sh
  4. enter the result from "masternode genkey" when asked.

STARTING WALLET
  1. cd ~
  2. ./ignintiond
  
Now your wallet should be started. Wait for it to fully sync before you start the masternode remotely from local wallet.
