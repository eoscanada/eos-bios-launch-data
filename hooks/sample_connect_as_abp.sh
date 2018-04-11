#!/bin/bash

# `connect_as_abp` hook:
# $1 = p2p_address
# $2 = public key used by BIOS
# $3 = private key used by BIOS
# $4 = genesis_json
# $5 = producer-name list (in case you've been cloned), like: "producer-name = hello\nproducer-name = hello.a"
# $6 = producer-name you should handle, split by comma

echo "Killing running nodes"
killall nodeos

echo "Phasing out any previous blockchain from disk"
rm -rf ~/.eos/blocks ~/.eos/shared_mem

echo "Writing genesis.json"
echo $4 > ~/.eos/genesis.json

echo "Copying base config"
# This one shouldn't contain any `producer-name` nor `private-key` nor `enable-stale-production` statements.
cp base_config.ini ~/.eos/config.ini
echo "plugin = eosio::producer_plugin" >> ~/.eos/config.ini
echo "$5" >> ~/.eos/config.ini
echo "private-key = [\"$2\",\"$3\"]" >> ~/.eos/config.ini

# Replace this by some automated command to restart the node.
echo "CONFIGURATION DONE: Re/start nodeos, and press ENTER"
read
