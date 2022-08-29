#!/bin/bash

requestsCount="${REQUESTS_COUNT:-3}"
sleepSeconds="${SECONDS_BETWEEN_REQUESTS:-0.5}"
IFS=' ' read -r -a arrUrls <<< "$URLS"

for i in $(seq $requestsCount); do
  RND=$(( ( RANDOM % ${#arrUrls[@]} )  ))
  echo "request to: ${arrUrls[$RND]}"
  curl -o /dev/null -s "${arrUrls[$RND]}" --insecure
  sleep $sleepSeconds
done

