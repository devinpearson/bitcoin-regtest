#!/bin/bash
DIR=$HOME/regtest

echo "Starting Bitcoin REGTEST from ${DIR}..."

command -v bitcoind >/dev/null 2>&1 || { echo >&2 "I require bitcoind but it's not installed. run brew install bitcoin. Aborting."; exit 1; }
if open -Ra "Bitcoin Core" ; then
  echo "VERIFIED: 'Bitcoin Core' is installed"
else
  echo "ERROR: 'Bitcoin Core' is not installed. run brew cask install bitcoin-core."
  exit 1;
fi

if [ ! -d "$DIR" ]; then
  mkdir $DIR
  echo "Creating folder in ${DIR}..."
  mkdir $DIR/A
  mkdir $DIR/B
  mkdir $DIR/GUI
  echo "Copying scripts in to ${DIR}..."
  cp -r ./scripts $DIR
fi

bitcoind -server -listen -port=17591 -rpcuser=bitcoinrpc -rpcpassword=test -rpcport=16591 -datadir=$DIR/A/ -connect=localhost:17592 -regtest -pid=$DIR/A/.pid -daemon -debug -walletnotify="$DIR/scripts/transaction.sh %s" -blocknotify="$DIR/scripts/block.sh %s"
bitcoind -server -listen -port=17592 -rpcuser=bitcoinrpc -rpcpassword=test -rpcport=16592 -datadir=$DIR/B/ -connect=localhost:17593 -regtest -pid=$DIR/B/.pid -daemon -debug
open -a "Bitcoin Core" --args -server -listen -port=17593 -rpcuser=bitcoinrpc -rpcpassword=test -rpcport=16593 -datadir=$DIR/GUI/ -connect=localhost:17591 -regtest -pid=$DIR/GUI/.pid -debug
echo "Bitcoin Core starting"