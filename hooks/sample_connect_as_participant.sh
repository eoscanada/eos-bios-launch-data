#!/bin/bash

# `connect_as_participant` hook:
# $1 = p2p_address
# $2 = public key for this node
# $3 = private key for this node (loaded from `block_signing_private_key_path`)
# $4 = genesis_json
# $5 = local producer-name

echo "Killing running nodes"
killall nodeos

echo "Phasing out any previous blockchain from disk"
rm -rf ~/.eos/blocks ~/.eos/shared_mem

echo "Copying base config"
# Your base_config.ini shouldn't contain any `producer-name` nor `private-key` nor `enable-stale-production` statements.
cp base_config.ini ~/.eos/config.ini

echo "Writing genesis.json"
echo $4 > ~/.eos/genesis.json

# INSERT YOUR NODE NAME HERE:
echo "producer-name = $5" >> ~/.eos/config.ini
echo "plugin = eosio::producer_plugin" >> ~/.eos/config.ini
echo "p2p-peer-address = $1" >> ~/.eos/config.ini
echo "private-key = [\"$2\",\"$3\"]" >> ~/.eos/config.ini
echo "resync-blockchain = true" >> ~/.eos/config.ini

# Replace this by some automated command to restart the node.
echo "CONFIGURATION DONE: Re/start nodeos, and press ENTER"
read
