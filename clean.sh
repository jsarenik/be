# grep -nr cdn . | less
sed -i 's|https://cdn.bitcoinexplorer.org||g' $1
sed -i 's|bitcoinexplorer.org|be.anyone.eu.org|g' $1
