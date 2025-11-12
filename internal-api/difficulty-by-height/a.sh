start=${1:-0}

for i in $(seq $start $(($start+9)))
do
  num=$((2016*$i))
  printf "%s," $num
done | sed 's/,$//'
echo
