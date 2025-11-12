#!/bin/sh

for i in $(seq 0 87)
do
  wget https://bitcoinexplorer.org/quote/$i
done
