#!/bin/bash

function exit_script(){
  echo "Caught SIGTERM"
  exit 0
}

trap exit_script SIGTERM

echo ""
echo Starting FlareSolverr

python3 /app/flaresolverr.py >/dev/null &

echo Starting vzum 
echo ""

if [[ -f "/downloads/download.txt" ]]; then
    echo "Downloading links from /downloads/download.txt"
    for URL in $(cat /downloads/download.txt)
    do
        python3 /app/ulozto-downloader/ulozto-downloader.py --parts 30 --parts-progress --auto-captcha --output "/downloads" "$URL"
    done
else
    python3 /app/ulozto-downloader/ulozto-downloader.py --auto-captcha --parts 30 --parts-progress --output "/downloads" "$@"
fi

exit 0
