#!/bin/sh

{
cat <<EOF
block-analysis https://anyone.eu.org/bitcoin.txt
block-stats https://anyone.eu.org/bitcoin.txt
blocks https://mempool.space/blocks
mempool-summary https://anyone.eu.org/bitcoin.txt
mempool-transactions https://anyone.eu.org/bitcoin.txt
next-halving https://anyone.eu.org/halving.txt
peers https://anyone.eu.org/bitcoin.txt
rpc-browser https://anyone.eu.org/bitcoin.txt
rpc-terminal https://anyone.eu.org/bitcoin.txt
tx-stats https://anyone.eu.org/bitcoin.txt
utxo-set https://anyone.eu.org/bitcoin.txt
api/docs https://anyone.eu.org/bitcoin.txt
EOF
} | cat > _redirects
