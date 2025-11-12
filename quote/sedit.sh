#!/bin/sh

for i in [0-9] [0-9][0-9];
do
  sed -i -e 's/>Bitcoin Explorer</>Bitcoin</' $i
done
