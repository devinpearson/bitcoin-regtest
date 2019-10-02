#!/bin/sh
curl -d "hash=$1" -H "Accept: application/json" http://faucet.test/api/blocknotify
