#!/bin/ash

tmp=$(busybox mktemp /dev/shm/be/tmp-XXXXXX)

bed=/home/nsm/web/ln/be
myp=/dev/shm/be
mkdir -p $myp

doit() {
curl -s 'https://bitcoinexplorer.org/' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'Accept-Language: en-US,en;q=0.9,sk;q=0.8' \
  -H 'Cache-Control: max-age=0' \
  -H 'Connection: keep-alive' \
  -H 'Cookie: connect.sid=s%3AR2nstIrbBOBex06UpCJo-bNMVw1Jm2cs.XEqt810BuhptI%2Fx%2BYcan%2B%2Bf3OaM%2F6SpDjZS6EjQ9ZNM; user-settings=%7B%22browserTzOffset%22%3A%22-2%22%2C%22homepageWelcomeBannerDismissed%22%3A%22true%22%7D' \
  -H 'If-None-Match: W/"13135-nyU3W2Lz4q5DSwAWK56ZFBB639Q"' \
  -H 'Referer: https://bitcoinexplorer.org/' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Not)A;Brand";v="99", "Google Chrome";v="127", "Chromium";v="127"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  | sed 's/ data-domain="bitcoinexplorer/ data-domain="be.anyone.eu/' > $tmp
  #wget -qO - $1 > $tmp | sed 's/ data-domain="bitcoinexplorer/ data-domain="be.anyone.eu/' > $tmp
  grep -qi 'Network Summary' $tmp || { rm $tmp; return 1; }
  sed -i 's/light">Bitcoin Explorer/light">Bitcoin/' $tmp
  /bin/mv -uf $tmp $2
#  ln -nsf $myp/$2 $bed/$3
}
doitr() {
  wget -qO - $1 > $tmp | sed 's/ data-domain="bitcoinexplorer/ data-domain="be.anyone.eu/' > $tmp
  #grep -q 'sat/vB' $tmp || { rm $tmp; return 1; }
  /bin/mv -uf $tmp $2
}

cd $myp

#doitr https://bitcoinexplorer.org/snippet/next-block next-block snippet
#doit https://bitcoinexplorer.org/ index.html
rm -f $tmp

cd $bed
sh gendiff.sh
