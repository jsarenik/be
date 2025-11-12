URL=https://cdn.bitcoinexplorer.org

myget() {
  file=$1
  dir=${file%/*}
  loc=${file#*2023-06-14-bfc9f97715/}
  mkdir -p $dir
  (cd $dir; cp /home/be/src/btc-rpc-explorer-be/public/$loc .)
}

{
cat <<EOF
public/2023-06-14-bfc9f97715/style/highlight.min.css
public/2023-06-14-bfc9f97715/style/dark-v1.min.css
public/2023-06-14-bfc9f97715/style/light.min.css
public/2023-06-14-bfc9f97715/style/dark.min.css
public/2023-06-14-bfc9f97715/font/bootstrap-icons.woff2
public/2023-06-14-bfc9f97715/font/bootstrap-icons.woff
public/2023-06-14-bfc9f97715/style/bootstrap-icons.css
public/2023-06-14-bfc9f97715/img/network-mainnet/apple-touch-icon.png
public/2023-06-14-bfc9f97715/img/network-mainnet/favicon-32x32.png
public/2023-06-14-bfc9f97715/img/network-mainnet/favicon-16x16.png
public/2023-06-14-bfc9f97715/img/network-mainnet/favicon.ico
public/2023-06-14-bfc9f97715/img/network-mainnet/logo.svg
public/2023-06-14-bfc9f97715/img/network-mainnet/logo.svg
public/2023-06-14-bfc9f97715/img/network-testnet/logo.svg
public/2023-06-14-bfc9f97715/img/network-signet/logo.svg
public/2023-06-14-bfc9f97715/js/jquery.min.js
public/2023-06-14-bfc9f97715/js/bootstrap.bundle.min.js
public/2023-06-14-bfc9f97715/js/site.js
public/2023-06-14-bfc9f97715/js/highlight.min.js
EOF
} | while read l; do myget $l; done
