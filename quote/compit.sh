#!/bin/sh

for i in [0-9] [0-9][0-9];
do
  /home/be/brotli-it-one.sh $i
  /home/be/gzip-it.sh $i
done
