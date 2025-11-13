#!/bin/sh

sh update-headers.sh > _headers
sh update-redirects.sh

set | grep -i github || exit
ver=$(git rev-parse HEAD | cut -b-7)
sed -i "s/1236/$ver/" index.html
