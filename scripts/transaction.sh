#!/bin/sh
curl -d "txid=$1" -H "Accept: application/json" http://faucet.test/api/walletnotify
