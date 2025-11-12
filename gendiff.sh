. /dev/shm/UpdateTip-bitcoin
#grep -qw $height difficulty-history && exit
(
cd internal-api/difficulty-by-height
sh gennum.sh
)
tmp=$(mktemp /dev/shm/gendiff-XXXXXX)
sed "s|.*HERE$|var blockCount = $height; //HERE|" \
  /home/nsm/web/ln/be/difficulty-history-bak \
  > $tmp
mv $tmp /dev/shm/difficulty-history
#rm -f $tmp
