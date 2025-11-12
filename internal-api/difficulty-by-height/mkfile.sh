file=${1##*/}
echo $file
IFS=,
{
{
echo {
for block in $file
do
printf '"%s":' $block
bitcoin-cli getblockheader $(bitcoin-cli getblockhash $block) \
  | jq -c '{difficulty: (.difficulty | tostring), time: .time}'
done | paste -sd"," -
echo }
} | tr -d "\n"
echo
} > $file

#  | grep -w "time\|difficulty" \
