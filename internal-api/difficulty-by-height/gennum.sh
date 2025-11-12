. /dev/shm/UpdateTip-bitcoin

seq 0 2016 $height | paste -d, - - - - - - - - - - | sed 's/,\+$//g' \
  | tail -1 | while read blocks
do
  test -r $blocks && continue
  sh mkfile.sh $blocks
done

# Clean up leftovers
export LC_ALL=C
seq 0 20160 $height | tail -1 | while read start
do
  ls ${start},* 2>/dev/null \
    | sort | head -n -1 | while read rm; do rm -v $rm; done
done
