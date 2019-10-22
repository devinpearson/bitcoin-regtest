# bitcoin-regtest
simple script for setting up and running a local bitcoin regtest network

This is currently macOS only

Requires both bitcoind and Bitcoin Core to be installed via brew.

```bash
brew install bitcoin
brew cask install bitcoin-core
```
by default it will add the folder to $HOME as /regtest

You can override this using the $DIR variable in the ./start-regtest-network.sh script.
 
if your wanting to use the block and wallet notify scripts they can be updated in the /scripts folder. the current example if for calling webhooks

The ./stop-regtest-network.sh script is an easy way of halting the network.
