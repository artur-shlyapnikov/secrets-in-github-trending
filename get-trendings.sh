#!/bin/bash
set -e

API="https://api.github.com/search/repositories?q=created:>$(date -v-30d +'%Y-%m-%d')&sort=stars&order=desc"

data=$(curl -s $API)

if [ -z "$data" ]; then
  echo "No data received from API" >&2
  exit 1
fi

urls=$(echo $data | jq -r '.items[].html_url' | head -100)

for url in $urls
do
  echo $url
done